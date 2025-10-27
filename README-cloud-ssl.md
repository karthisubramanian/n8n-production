# n8n Production Deployment Guide (Cloud Panel SSL)

## Overview
This setup provides a production-ready n8n deployment with PostgreSQL database and Nginx reverse proxy, configured for cloud panel SSL management.

## Architecture
- **n8n**: Workflow automation platform (port 5679)
- **PostgreSQL**: Database (port 5433)
- **Nginx**: Reverse proxy HTTP only (port 8091)
- **Cloud Panel**: SSL termination and domain management

## Quick Start

1. **Configure Environment**:
   ```bash
   cp env.example .env
   # Edit .env with your secure passwords and settings
   ```

2. **Generate Encryption Key**:
   ```bash
   openssl rand -base64 32
   # Add the output to N8N_ENCRYPTION_KEY in .env
   ```

3. **Deploy**:
   ```bash
   docker-compose -f docker-compose.prod.yml up -d
   ```

4. **Configure Cloud Panel SSL**:
   - Domain: `n8n.gdart.in`
   - Backend: `http://localhost:8091`
   - Enable SSL in cloud panel

5. **Access n8n**:
   - URL: https://n8n.gdart.in (via cloud panel)
   - Login with credentials from .env file

## Port Configuration
- **8092**: HTTP (cloud panel SSL termination)
- **5679**: n8n application (internal)
- **5433**: PostgreSQL (internal)

## Cloud Panel SSL Setup

### Configuration Steps:
1. **Add Domain**: `n8n.gdart.in`
2. **Backend URL**: `http://localhost:8092`
3. **Enable SSL**: Use cloud panel SSL management
4. **Force HTTPS**: Redirect HTTP to HTTPS

### Benefits:
- ✅ Automatic SSL certificate management
- ✅ Auto-renewal handled by cloud panel
- ✅ No manual certificate management
- ✅ Simplified nginx configuration

## Security Features
- SSL/TLS encryption (via cloud panel)
- Security headers
- Rate limiting
- Basic authentication
- WebSocket support for real-time features

## Monitoring
- Health check endpoint: https://n8n.gdart.in/healthz
- Container logs: `docker-compose logs -f n8n`

## Troubleshooting
- Check container status: `docker-compose ps`
- View logs: `docker-compose logs [service_name]`
- Restart services: `docker-compose restart [service_name]`

## Fix 502 Errors
If you encounter 502 errors:
```bash
./fix-cloud-ssl.sh
```
