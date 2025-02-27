# Start with a base Go image
FROM golang:1.20-alpine

# Install bash or sh
RUN apk add --no-cache bash

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files to the container (so dependencies can be fetched first)
COPY go.mod go.sum ./

# Download Go dependencies
RUN go mod tidy

# Copy all the Go source code into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose the port the app will run on
EXPOSE 8080

# Command to run the app
CMD ["/app/main"]