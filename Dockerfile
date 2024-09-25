# Use Ubuntu as the base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install MySQL and Python dependencies
RUN apt-get update && apt-get install -y \
    mysql-server \
    python3 \
    python3-pip

# Set MySQL root password environment variable
ENV MYSQL_ROOT_PASSWORD=123456

# Create a working directory
WORKDIR /app

# Copy requirements.txt and install Python dependencies
COPY ./requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt

# Expose the MySQL port
EXPOSE 3306

# Start MySQL service and run the bash shell
CMD service mysql start && bash
