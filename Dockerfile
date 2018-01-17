FROM alpine

RUN apk -U add bash curl jq
RUN mkdir -p /work
WORKDIR /work
ADD delete-app-definitions.sh /work
