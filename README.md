# n8n Production Deployment

Production-ready Docker setup for n8n workflow automation platform with PostgreSQL database and Nginx reverse proxy.

## Features

- 🐳 Docker Compose production setup
- 🗄️ PostgreSQL database for production use
- 🔒 SSL/TLS encryption with Nginx reverse proxy
- 🔐 Basic authentication
- 🌐 Domain configuration for n8n.gdart.in
- 📊 Health monitoring and logging
- 🔄 WebSocket support for real-time features

## Quick Start

1. Copy environment template:
   ```bash
   cp env.example .env
   ```

2. Generate encryption key:
   ```bash
   openssl rand -base64 32
   ```

3. Update `.env` with your secure passwords and encryption key

4. Setup SSL certificates in `nginx/ssl/` directory

5. Deploy:
   ```bash
   docker-compose -f docker-compose.prod.yml up -d
   ```

6. Access n8n at: https://n8n.gdart.in

## Port Configuration

- **8091**: HTTP (redirects to HTTPS)
- **8454**: HTTPS
- **5679**: n8n application (internal)
- **5433**: PostgreSQL (internal)

## Security

- SSL/TLS encryption
- Security headers
- Rate limiting
- Basic authentication
- Secure environment variables

## Documentation

See `README.md` for detailed deployment instructions.