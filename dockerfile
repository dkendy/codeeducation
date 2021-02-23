FROM golang:1.14-alpine as builder

WORKDIR /go/src/app
COPY main.go .
 
RUN go get -d -v ./...
RUN go install -v ./...
RUN go build 

FROM scratch as final 
COPY --from=builder /go/src/app/app  .  

CMD [ "./app" ]
