# desktop ubuntu ver. selection
### https://docs.linuxserver.io/images/docker-webtop/#version-tags

FROM lscr.io/linuxserver/webtop:ubuntu-kde
# FROM lscr.io/linuxserver/webtop:ubuntu-xfce <-- XFCE Ubuntu
# FROM lscr.io/linuxserver/webtop:latest # <-- XFCE Alpine

ENV TZ=Asia/Tokyo

# Install packages
RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y \
     git \
     curl \
     python3 \
     python3-pip \
     python-is-python3 \
     libgl1-mesa-dev \
     libglib2.0-0 \
     fonts-takao \
     libreoffice \
     libreoffice-l10n-ja \
     ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

  # CA証明書を更新
RUN update-ca-certificates

ENV PATH=/config/.local/bin:$PATH
# RUN mkdir -p /config/.cache/uv && chown -R abc:abc /config/.cache/uv
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]