FROM golang
COPY . .
ARG IS_PRODUCTION=false
RUN if [ "$IS_PRODUCTION" = "true" ]; then go build -o main main.go -ldflags "-s -w"; else go build -o main main.go; fi
CMD ["./main"]
