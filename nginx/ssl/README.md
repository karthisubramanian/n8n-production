# SSL Certificate Setup Instructions

## For Production Deployment

1. **Obtain SSL Certificates**:
   - Use Let's Encrypt with Certbot: `certbot certonly --standalone -d n8n.gdart.in`
   - Or use your existing SSL certificates

2. **Place Certificates**:
   - Copy your certificate file to: `nginx/ssl/cert.pem`
   - Copy your private key to: `nginx/ssl/key.pem`

3. **File Permissions**:
   ```bash
   chmod 644 nginx/ssl/cert.pem
   chmod 600 nginx/ssl/key.pem
   ```

## For Development/Testing

If you need to create self-signed certificates for testing:

```bash
# Generate self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout nginx/ssl/key.pem \
    -out nginx/ssl/cert.pem \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=n8n.gdart.in"
```

## Important Notes

- Never commit actual SSL certificates to version control
- Keep private keys secure
- For production, always use valid SSL certificates from a trusted CA
- Consider using automated certificate renewal with Let's Encrypt