FROM golang:alpine AS main

WORKDIR /

COPY main.go .

RUN go mod init example.com/m && go install && go build -o main.go


FROM scratch

COPY --from=main /main.go /main.go

CMD ["/main.go"]