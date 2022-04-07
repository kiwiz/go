FROM golang:rc as builder

COPY . /src

WORKDIR /src/cmd/go
RUN go build -mod=vendor

FROM scratch

COPY --from=builder /src/cmd/go/go /go

EXPOSE 8067

CMD ["/go", "--data=/data"]
