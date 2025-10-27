#!/bin/bash

# Quick fix script for n8n production with cloud panel SSL
echo "🔧 Fixing n8n production for cloud panel SSL..."

# Stop current containers
echo "Stopping current containers..."
docker-compose -f docker-compose.prod.yml down

# Start services with updated config
echo "Starting services with cloud panel SSL config..."
docker-compose -f docker-compose.prod.yml up -d

# Check status
echo "Checking container status..."
docker-compose ps

echo ""
echo "✅ Fix applied! n8n should now be accessible at:"
echo "🌐 http://n8n.gdart.in:8092 (via cloud panel)"
echo ""
echo "📝 Next steps:"
echo "1. Configure SSL in your cloud panel for n8n.gdart.in"
echo "2. Point SSL to port 8092 (internal)"
echo "3. Test HTTPS access via cloud panel"
echo ""
echo "🔧 Cloud Panel Configuration:"
echo "- Domain: n8n.gdart.in"
echo "- Backend: http://localhost:8092"
echo "- SSL: Enable in cloud panel"
