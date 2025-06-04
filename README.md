# Custom Chatbot with LLMs

A modern, scalable chatbot application built with React, Node.js, and integrated with multiple Large Language Model providers including OpenAI GPT and Hugging Face models.

## 🚀 Features

- **Multi-Provider LLM Support**: Seamlessly switch between OpenAI, Hugging Face, and local models
- **Real-time Chat Interface**: Responsive, modern UI with typing indicators and message status
- **Conversation Management**: Persistent chat history with search and export functionality
- **Context-Aware Responses**: Smart context management with token optimization
- **Dark/Light Theme**: User preference support with system theme detection
- **Mobile Responsive**: Optimized for all device sizes
- **Error Handling**: Graceful error recovery with user-friendly messages
- **Rate Limiting**: Built-in protection against API abuse
- **Export/Import**: Conversation backup and restore functionality

## 🛠 Technology Stack

### Frontend
- **React 18** with TypeScript
- **Tailwind CSS** for styling
- **Lucide React** for icons
- **Vite** for build tooling

### Backend
- **Node.js** with Express
- **TypeScript** for type safety
- **Socket.io** for real-time communication
- **JSON file storage** (easily extensible to databases)

### LLM Integration
- **OpenAI API** (GPT-3.5/4)
- **Hugging Face Transformers**
- **Custom provider interface** for extensibility

## 📋 Prerequisites

- Node.js 16+ and npm
- OpenAI API key (optional)
- Hugging Face API key (optional)

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/maybajpa2024/Building-Custom-Chatbot-with-LLMs.git
cd custom-chatbot-llms
```

### 2. Install Dependencies
```bash
# Install frontend dependencies
npm install

# Install backend dependencies
cd server
npm install
cd ..
```

### 3. Environment Setup
```bash
# Copy environment template
cp .env.example .env

# Edit .env with your API keys
OPENAI_API_KEY=your_openai_key_here
HUGGINGFACE_API_KEY=your_hf_key_here
```

### 4. Start Development Servers
```bash
# Terminal 1: Start backend server
cd server
npm run dev

# Terminal 2: Start frontend development server
npm start
```

### 5. Access the Application
Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🐳 Docker Deployment

### Using Docker Compose
```bash
# Build and start containers
docker-compose up --build

# Access at http://localhost:3000
```

### Manual Docker Build
```bash
# Build the image
docker build -t custom-chatbot .

# Run the container
docker run -p 3000:3000 -p 3001:3001 custom-chatbot
```

## 📖 Documentation

- **[Project Report](docs/PROJECT_REPORT.pdf)** - Comprehensive project documentation
- **[API Documentation](docs/API_DOCUMENTATION.md)** - Backend API reference
- **[User Guide](docs/USER_GUIDE.md)** - End-user instructions
- **[Deployment Guide](docs/DEPLOYMENT_GUIDE.md)** - Production deployment instructions

## 🧪 Testing

```bash
# Run all tests
npm test

# Run tests with coverage
npm run test:coverage

# Run specific test suite
npm run test:components
```

## 🏗 Architecture Overview

### System Architecture
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React Frontend │────│  Express Backend │────│   LLM Providers │
│                 │    │                 │    │                 │
│ • Chat Interface│    │ • API Routes    │    │ • OpenAI        │
│ • State Mgmt    │    │ • WebSocket     │    │ • Hugging Face  │
│ • Real-time UI  │    │ • Context Mgmt  │    │ • Local Models  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Key Components

#### Frontend (`src/`)
- **ChatInterface**: Main chat component with message display
- **SettingsPanel**: LLM provider and parameter configuration
- **ConversationList**: Chat history management
- **MessageBubble**: Individual message rendering

#### Backend (`server/src/`)
- **LLM Providers**: Abstracted interfaces for different AI services
- **Conversation Manager**: Context and history management
- **Rate Limiter**: API protection and usage control
- **Error Handler**: Centralized error processing

## 📊 Features in Detail

### 1. Multi-Provider LLM Support
Switch seamlessly between different AI providers:
- **OpenAI**: GPT-3.5-turbo, GPT-4
- **Hugging Face**: Open-source models
- **Local**: Custom or self-hosted models

### 2. Smart Context Management
- Token-aware context windows
- Conversation summarization for long chats
- Optimized API usage

### 3. Real-time Communication
- WebSocket-based messaging
- Typing indicators
- Message status updates
- Connection state management

### 4. Conversation Management
- Persistent chat history
- Search across conversations
- Export conversations to text/JSON
- Conversation organization and tagging

## 🔧 Configuration

### Environment Variables
```bash
# Backend Configuration
PORT=3001
NODE_ENV=development

# LLM Provider Keys
OPENAI_API_KEY=sk-...
HUGGINGFACE_API_KEY=hf_...

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# CORS Configuration
FRONTEND_URL=http://localhost:3000
```

### LLM Settings
Configure model parameters through the settings panel:
- **Temperature**: Response creativity (0.0-1.0)
- **Max Tokens**: Response length limit
- **System Prompt**: Initial behavior instructions

## 🔒 Security Features

- **API Key Protection**: Environment variable storage
- **Rate Limiting**: Prevent API abuse
- **Input Sanitization**: XSS and injection protection
- **CORS Configuration**: Restrict cross-origin requests
- **Error Handling**: No sensitive data exposure

## 🚀 Performance Optimizations

- **Lazy Loading**: Component-based code splitting
- **Message Virtualization**: Efficient large conversation rendering
- **Request Debouncing**: Reduced API calls
- **Caching**: Response and configuration caching
- **Compression**: Gzip response compression

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow TypeScript best practices
- Add tests for new features
- Update documentation
- Use conventional commit messages

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- OpenAI for GPT models and API
- Hugging Face for open-source model access
- React and Node.js communities
- Contributors and testers

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/maybajpa2024/Building-Custom-Chatbot-with-LLMs/issues)
- **Discussions**: [GitHub Discussions](https://github.com/maybajpa2024/Building-Custom-Chatbot-with-LLMs/discussions)
- **Email**: support@example.com

## 🗺 Roadmap

### Version 2.0
- [ ] Voice chat integration
- [ ] Multi-language support
- [ ] Custom model fine-tuning
- [ ] Advanced analytics dashboard

### Version 3.0
- [ ] Multi-modal AI (image/video)
- [ ] Collaborative features
- [ ] Enterprise SSO integration
- [ ] Advanced workflow automation

---

**Built with ❤️ for the AI community**
