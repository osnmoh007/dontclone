
FROM stilleshan/hideipnetwork-web

# Create the /app directory
RUN mkdir -p /app

# Set the working directory
WORKDIR /app

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    screen \
    htop \
    nano \
    wget \
    curl \
    tar

# Copy the local entrypoint script into the container
COPY entrypoint.sh /app/


EXPOSE 56559

# Make the entrypoint script executable
RUN chmod +x entrypoint.sh

# Use the custom entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
