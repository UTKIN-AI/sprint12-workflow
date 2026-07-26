FROM golang:1.25.2-alpine

WORKDIR /app

ENV GOPROXY=https://goproxy.cn,https://proxy.golang.org,direct

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
COPY tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go

CMD ["/main"]
