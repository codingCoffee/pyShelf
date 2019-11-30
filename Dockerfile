FROM python:alpine

COPY requirements.txt /pyshelf/requirements.txt
WORKDIR /pyshelf

RUN set -ex \
  && apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    libxml2-dev \
    libxslt-dev \
    musl-dev \
    build-base \
    libffi-dev \
    python-dev \
    jpeg-dev \
    zlib-dev \
  && pip install -U \
    pip \
  && pip install -r requirements.txt \
  && apk del .build-deps


COPY . /pyshelf
EXPOSE 5000
#ENTRYPOINT cd src && python manage.py runserver 0.0.0.0:5000
