FROM alpine:3

# hadolint ignore=DL3018
RUN apk add --no-cache git curl jq
COPY gitflow /usr/local/bin/gitflow

CMD ["/usr/local/bin/gitflow"]
