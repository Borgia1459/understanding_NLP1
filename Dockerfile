
# Use a lightweight Debian-based image
FROM debian:bookworm-slim

# Set the working directory
WORKDIR /src/

# Install required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    python3-setuptools \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    git && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user and set permissions
RUN useradd -m -u 1000 user && \
    chown -R user:user /src
USER user

# Copy the notebook file
COPY NLP.ipynb .

# Optional: Copy and install Python dependencies
# Uncomment the following lines if you have a requirements.txt file
# COPY requirements.txt .
# RUN pip3 install -r requirements.txt

# Set environment variables
ENV key=ipynb

# Expose port 8000
EXPOSE 8000

