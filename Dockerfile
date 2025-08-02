# Use an official Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy your requirements (dependencies) list
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Set environment variables (optional for Flask)
ENV FLASK_APP=recipes
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 for Flask
EXPOSE 5000

# Run the Flask app
# CMD ["flask", "run"]

ENV command1="flask --app recipes init-db"
ENV command2="flask --app recipes run"

CMD ["sh", "-c", "command1 && command2"]