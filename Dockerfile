# Use official Python runtime as a base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install any dependencies from requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY . /app/

# Expose the port Flask will run on
EXPOSE 8080

# Set environment variable for Flask to run in production mode
ENV FLASK_APP=main.py
ENV FLASK_ENV=production

# Start the Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
