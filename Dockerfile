# BUILDER
FROM golang:1.15-alpine AS builder
COPY . .
RUN go get -d -v ./...
RUN go build -o ./main​
# RUNNING
FROM debian:buster
RUN mkdir /app
COPY --from=builder ./main /app/main
WORKDIR /app/
CMD ["/app/main"]