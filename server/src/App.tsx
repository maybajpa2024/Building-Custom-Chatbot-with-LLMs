# Custom Chatbot with LLMs - Complete Project Package

## Project Structure
```
custom-chatbot-llms/
├── README.md
├── package.json
├── package-lock.json
├── .env.example
├── .gitignore
├── docker-compose.yml
├── Dockerfile
├── docs/
│   ├── PROJECT_REPORT.pdf
│   ├── API_DOCUMENTATION.md
│   ├── USER_GUIDE.md
│   └── DEPLOYMENT_GUIDE.md
├── src/
│   ├── components/
│   │   ├── ChatInterface.tsx
│   │   ├── MessageBubble.tsx
│   │   ├── SettingsPanel.tsx
│   │   └── ConversationList.tsx
│   ├── services/
│   │   ├── llmService.ts
│   │   ├── conversationService.ts
│   │   └── apiService.ts
│   ├── types/
│   │   └── index.ts
│   ├── utils/
│   │   ├── tokenizer.ts
│   │   └── constants.ts
│   ├── App.tsx
│   ├── index.tsx
│   └── index.css
├── server/
│   ├── src/
│   │   ├── controllers/
│   │   │   └── chatController.ts
│   │   ├── services/
│   │   │   ├── llmProviders/
│   │   │   │   ├── openaiProvider.ts
│   │   │   │   ├── huggingfaceProvider.ts
│   │   │   │   └── providerFactory.ts
│   │   │   └── conversationManager.ts
│   │   ├── middleware/
│   │   │   ├── auth.ts
│   │   │   ├── rateLimiter.ts
│   │   │   └── errorHandler.ts
│   │   ├── routes/
│   │   │   └── chatRoutes.ts
│   │   ├── utils/
│   │   │   └── validation.ts
│   │   └── server.ts
│   ├── package.json
│   └── tsconfig.json
├── tests/
│   ├── __tests__/
│   │   ├── components/
│   │   ├── services/
│   │   └── integration/
│   ├── jest.config.js
│   └── setupTests.ts
├── public/
│   ├── index.html
│   ├── favicon.ico
│   └── manifest.json
├── scripts/
│   ├── build.sh
│   ├── deploy.sh
│   └── test.sh
└── tsconfig.json
```

## File Contents

### 1. README.md
