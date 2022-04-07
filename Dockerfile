FROM golang:rc as builder

COPY . /src

WORKDIR /src/cmd/go
RUN go build -mod=vendor -o /usr/bin/go

EXPOSE 8067

CMD ["/usr/bin/go", "--data=/data"]
