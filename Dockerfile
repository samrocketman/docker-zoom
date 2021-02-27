FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# zoom prerequisites not included in their deps
RUN set -ex; \
apt-get update; \
apt-get install -y curl pulseaudio pulseaudio-utils; \
apt-get clean

RUN set -ex; \
apt-get update; \
curl -fLo /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb; \
apt install -y /tmp/zoom.deb; \
rm -f /tmp/zoom.deb; \
apt-get clean

RUN yes '' | adduser --disabled-password --uid 1000 zoom; \
usermod -a -G audio zoom; \
usermod -a -G video zoom

USER zoom
WORKDIR /home/zoom
CMD /usr/bin/zoom
