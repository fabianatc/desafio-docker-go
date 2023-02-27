FROM golang:alpine AS builder

WORKDIR /go-src

COPY hello-world.go .

RUN go build hello-world.go

CMD ["./hello-world"]


FROM scratch

WORKDIR /go-bin

COPY --from=builder /go-src/hello-world .

CMD ["./hello-world"]
