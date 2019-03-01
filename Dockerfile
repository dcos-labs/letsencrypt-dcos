FROM debian:stretch

WORKDIR /
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y certbot curl python python-requests \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

WORKDIR /certbot
COPY run.sh /certbot/run.sh
COPY post_cert.py /certbot/post_cert.py

ENTRYPOINT ["/certbot/run.sh"]
