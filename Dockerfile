FROM n8nio/n8n:latest

USER root

# Install ffmpeg, python3, pip, and other dependencies
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    wget

# Install yt-dlp
RUN pip3 install --no-cache-dir yt-dlp --break-system-packages

# Switch back to node user for security
USER node

# Set working directory
WORKDIR /home/node

# Expose N8N port
EXPOSE 5678

CMD ["n8n"]