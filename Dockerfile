# build stage
FROM golang:latest AS builder

WORKDIR /app
COPY . .

RUN go build -o main main.go

# final stage
FROM alpine:3.18

WORKDIR /app
COPY --from=builder /app/main .

EXPOSE 8080
CMD ["./main"]
