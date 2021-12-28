FROM golang:latest AS builder

WORKDIR /code
COPY . .

RUN CGO_ENABLED=0 go build -a -installsuffix cgo -o /go/bin/tcp-echo /code

FROM alpine:latest
RUN apk --no-cache add ca-certificates

COPY --from=builder /go/bin/tcp-echo /tcp-echo

WORKDIR /

ENTRYPOINT ["/tcp-echo"]
