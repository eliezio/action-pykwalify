FROM python:3-alpine

RUN apk add --no-cache bash
RUN pip install --no-cache-dir pykwalify

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
