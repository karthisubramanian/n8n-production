#!/bin/bash

# Fix n8n encryption key mismatch
echo "🔧 Fixing n8n encryption key mismatch..."

# Stop containers
echo "Stopping containers..."
docker-compose down

# Remove n8n data volume to start fresh
echo "Removing old n8n data volume..."
docker volume rm n8n_n8n_data 2>/dev/null || echo "Volume already removed"

# Start containers
echo "Starting containers with fresh data..."
docker-compose up -d

# Wait a moment for startup
echo "Waiting for services to start..."
sleep 10

# Check status
echo "Checking container status..."
docker-compose ps

echo ""
echo "✅ Fix applied! n8n should now start properly."
echo "🌐 Access at: http://n8n.gdart.in:8092"
echo ""
echo "📝 Note: You'll need to set up n8n again (create admin user, etc.)"
echo "   since we cleared the data volume."
