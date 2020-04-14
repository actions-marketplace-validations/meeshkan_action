FROM kiwicom/schemathesis:stable

# FROM alpine:3.10
# RUN apk add --update curl \
#     && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

