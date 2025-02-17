FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy and install dependencies
COPY ./requirements.txt /app/requirements.txt
RUN test -f /app/requirements.txt && pip install --no-cache-dir -r requirements.txt || echo "No requirements.txt found, skipping install."

# Copy application files
COPY . .

# Expose the port (if needed)
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]
