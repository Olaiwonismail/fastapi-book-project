# Use Python as the base image
FROM python:3.11

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy project files
COPY . .

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose necessary ports
EXPOSE 80 8000

# Start FastAPI & Nginx properly
CMD uvicorn main:app --host 0.0.0.0 --port 8000 & nginx -g 'daemon off;'

