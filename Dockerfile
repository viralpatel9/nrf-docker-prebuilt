FROM ghcr.io/nrfconnect/sdk-nrf-toolchain:v3.0.2

# Avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install extras if needed
# RUN apt-get update && apt-get install -y git python3-pip

# Create workspace
WORKDIR /opt/ncs

# Copy ONLY west manifest (important for caching)
COPY hello_world/west.yml .

# Initialize west using local manifest
RUN west init -l .

# Fetch all dependencies (THIS is the slow step we want to pre-bake)
RUN west update -o=--depth=1 -n

# Export environment
RUN west zephyr-export

# Default shell
CMD ["/bin/bash"]