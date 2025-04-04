# Python base image
FROM python:3.9-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY src/ .

# Environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

EXPOSE 80
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]