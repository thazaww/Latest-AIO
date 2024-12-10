FROM ubuntu:latest

WORKDIR /usr/src/app

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

# Update and install required packages
RUN apt-get -qq update && \
    apt-get -qq install -y git wget curl busybox python3 python3-pip locales ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy requirements file and install Python packages
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Ensure start.sh is executable
RUN chmod +x start.sh

# Command to run your application
CMD ["bash", "start.sh"]
