# Based on https://docs.docker.com/language/golang/build-images/#multi-stage-builds

##
## Build
##

FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /main

##
## Deploy
##

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /main /main
COPY db ./

EXPOSE 8080

ENTRYPOINT ["/main"]
