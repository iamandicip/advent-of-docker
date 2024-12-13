#!/bin/bash

docker run -d \
  --name api \
  --network myapp-network \
  -v mydata:/data \
  -e SECRET_MESSAGE="Hello Docker!" \
  -e PORT=8080 \
  -p 8080:8080 \
  hello-world-go
