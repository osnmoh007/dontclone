# Use the official Alpine base image
FROM stilleshan/hideipnetwork-web

# Create the /app directory
RUN mkdir -p /app

# Set the working directory
WORKDIR /app

# Update the package list and install necessary packages
RUN apk add --no-cache \
    screen \
    htop \
    nano \
    wget \
    curl \
    tar

# Copy the local entrypoint script into the container
COPY entrypoint.sh /app/

# Make the entrypoint script executable
RUN chmod +x entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
