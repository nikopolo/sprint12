FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o /my_app

COPY tracker.db ./

CMD ["/my_app"]