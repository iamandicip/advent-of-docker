# build stage
FROM golang:latest AS builder

WORKDIR /app
COPY . .

#RUN go build -o main main.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main main.go
#RUN ls -l main && file main


# final stage
FROM alpine:3.18

WORKDIR /app
COPY --from=builder /app .

EXPOSE 8080
CMD ["./main"]
