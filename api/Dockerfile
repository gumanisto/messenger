# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM golang:1.18-alpine

WORKDIR /app

ENV CGO_ENABLED 0
ENV GOPATH /go
ENV GOCACHE /go-build
ENV GO111MODULE on

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . ./

# RUN go build -o bin/api main.go
RUN go build -o bin/api main.go

CMD ["/app/bin/api"]