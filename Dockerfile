# Get the base Ubuntu image from Docker Hub
FROM alpine
# # Update required apps on the base image
# RUN apt-get -y update && apt-get install -y
# RUN apt-get -y install g++ cmake
RUN apk update && apk add git cmake make clang build-base llvm-static llvm-dev clang-static clang-dev gcompat libstdc++

# Copy the current folder which contains C++ source code to the Docker image
RUN mkdir /build
WORKDIR /build

COPY . .
# Specify the working directory


EXPOSE 3000

# Create build dir, configure CMake and run build
RUN cmake -B build -S .
RUN cmake --build build
# Run the built application

CMD ./build/WebServer