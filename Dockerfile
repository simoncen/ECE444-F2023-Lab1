FROM ubuntu:latest

# Update and install required packages
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential && apt-get clean

# Copy the current directory contents into the container at /app
COPY . /app

# Set the working directory
WORKDIR /app

# Install Python packages from requirements.txt
RUN pip install -r requirements.txt

# Set environment variables for Flask
ENV FLASK_APP=hello.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 for Flask
EXPOSE 5000

# Use the flask command to run the app
CMD ["flask", "run"]
