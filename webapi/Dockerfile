# Start with a base Go image
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy all the Go source code into the container
COPY . .

# Copy the Go module files to the container (so dependencies can be fetched first)
COPY go.mod go.sum.sum ./

# Download Go dependencies
RUN go mod tidy

# Build the Go app
RUN go build -o main .

# Expose the port the app will run on
EXPOSE 8080

# Command to run the app
CMD ["./main"]