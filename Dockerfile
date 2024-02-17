# Stage 1: Builder Stage
FROM alpine:latest as builder

# Set working directory
WORKDIR /app

# Copy data.txt into the container image
COPY data.txt .

# Stage 2: Final Stage
FROM fedora:latest

# Copy data.txt from the builder stage to the final image
COPY --from=builder /app/data.txt .

# Additional instructions for the final stage if needed

# Specify the default command to run when the container starts
CMD ["echo", "Container built with multi-staged Dockerfile"]
