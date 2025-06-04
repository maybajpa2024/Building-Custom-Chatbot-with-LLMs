import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import compression from 'compression';
import { createServer } from 'http';
import { Server as SocketIOServer } from 'socket.io';
import dotenv from 'dotenv';
import rateLimit from 'express-rate-limit';
import { ConversationManager } from './services/conversationManager';
import { LLMProviderFactory } from './services/llmProviders/providerFactory';
import { errorHandler } from './middleware/errorHandler';
import { logger } from './utils/logger';
import chatRoutes from './routes/chatRoutes';

// Load environment variables
dotenv.config();

const app = express();
const server = createServer(app);
const io = new SocketIOServer(server, {
  cors: {
    origin: process.env.FRONTEND_URL || "http://localhost:3000",
    methods: ["GET", "POST"]
  }
});

const PORT = process.env.PORT || 3001;

// Middleware
app.use(helmet());
app.use(compression());
app.use(cors({
  origin: process.env.FRONTEND_URL || "http://localhost:3000",
  credentials: true
}));
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true }));

// Rate limiting
const limiter = rateLimit({
  windowMs: parseInt(process.env.RATE_LIMIT_WINDOW_MS || '900000'), // 15 minutes
  max: parseInt(process.env.RATE_LIMIT_MAX_REQUESTS || '100'), // limit each IP to 100 requests per windowMs
  message: 'Too many requests from this IP, please try again later.',
  standardHeaders: true,
  legacyHeaders: false,
});
app.use('/api/', limiter);

// Services
const conversationManager = new ConversationManager();
const llmProviderFactory = new LLMProviderFactory();

// Routes
app.use('/api/chat', chatRoutes);

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    version: process.env.npm_package_version || '1.0.0'
  });
});

// Socket.IO connection handling
io.on('connection', (socket) => {
  logger.info(`Client connected: ${socket.id}`);

  socket.on('join_conversation', (conversationId: string) => {
    socket.join(conversationId);
    logger.info(`Socket ${socket.id} joined conversation ${conversationId}`);
  });

  socket.on('send_message', async (data) => {
    try {
      const { conversationId, message, settings } = data;
      
      // Validate input
      if (!message || typeof message !== 'string' || message.trim().length === 0) {
        socket.emit('error', { message: 'Invalid message format' });
        return;
      }

      // Get LLM provider
      const provider = llmProviderFactory.createProvider(
        settings?.provider || 'openai',
        settings
      );

      // Process message
      const conversation = await conversationManager.getOrCreateConversation(conversationId);
      
      // Add user message
      const userMessage = {
        id: Date.now().toString(),
        role: 'user' as const,
        content: message,
        timestamp: new Date()
      };
      
      conversation.messages.push(userMessage);
      await conversationManager.saveConversation(conversation);

      // Emit user message to all clients in conversation
      io.to(conversationId).emit('message_received', userMessage);

      // Generate AI response
      socket.emit('typing_start');
      
      const response = await provider.generateResponse(
        conversation.messages.slice(-10), // Last 10 messages for context
        settings
      );

      const assistantMessage = {
        id: (Date.now() + 1).toString(),
        role: 'assistant' as const,
        content: response,
        timestamp: new Date()
      };

      conversation.messages.push(assistantMessage);
      await conversationManager.saveConversation(conversation);

      socket.emit('typing_stop');
      io.to(conversationId).emit('message_received', assistantMessage);

    } catch (error) {
      logger.error('Error processing message:', error);
      socket.emit('typing_stop');
      socket.emit('error', {
        message: 'Failed to process message. Please try again.',
        retry: true
      });
    }
  });

  socket.on('disconnect', () => {
    logger.info(`Client disconnected: ${socket.id}`);
  });
});

// Error handling middleware
app.use(errorHandler);

// Start server
server.listen(PORT, () => {
  logger.info(`Server running on port ${PORT}`);
  logger.info(`Frontend URL: ${process.env.FRONTEND_URL || 'http://localhost:3000'}`);
  logger.info(`Environment: ${process.env.NODE_ENV || 'development'}`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  logger.info('SIGTERM received, shutting down gracefully');
  server.close(() => {
    logger.info('Process terminated');
  });
});

process.on('SIGINT', () => {
  logger.info('SIGINT received, shutting down gracefully');
  server.close(() => {
    logger.info('Process terminated');
  });
});

export default app;
