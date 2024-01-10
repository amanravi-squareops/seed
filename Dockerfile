# Dockerfile
FROM python:3.9-slim

# Add apache bench (ab) tool
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /seed

COPY seed-data/ .

# Create POST data files with ab-friendly formats
RUN python make-data.py

# Entry point for generating votes
CMD ["generate-votes.sh"]
