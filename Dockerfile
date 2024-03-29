# Use Alpine Linux as base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Install necessary packages
RUN apk --no-cache add g++ cmake make

# Copy source code to container
COPY . .

# Build the server
RUN g++ -o server main.cpp

# Expose port 3000
EXPOSE 3000

# Command to run the server
CMD ["./server"]