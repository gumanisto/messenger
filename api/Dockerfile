# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM golang:1.18-alpine

WORKDIR /app

ENV CGO_ENABLED 0
ENV GOPATH /go
ENV GOCACHE /go-build
ENV GO111MODULE on

COPY ./api/go.mod ./
COPY ./api/go.sum ./

RUN go mod download

COPY . ./
RUN ls

# RUN go build -o bin/api main.go
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o api ./api
RUN env GOOS=linux go build main.go

CMD ["/code/bin/api"]