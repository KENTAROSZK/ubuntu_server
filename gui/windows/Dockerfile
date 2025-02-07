# FROM ubuntu:latest
FROM --platform=linux/amd64 ubuntu:latest

# 必要な環境変数
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# 事前にgnupgを追加（gpgコマンドを利用するため）とwget（既にインストール済みの場合もあります）
RUN apt update -y && apt install --no-install-recommends -y \
      gnupg \
      wget

# 必須パッケージのインストール
RUN apt update -y && \
    apt install --no-install-recommends -y \
      xfce4 xfce4-goodies tigervnc-standalone-server novnc websockify sudo xterm init \
      systemd snapd vim net-tools curl git tzdata dbus-x11 x11-utils x11-xserver-utils x11-apps \
      fonts-liberation libasound2t64 libnspr4 libnss3 xdg-utils \
      locales fonts-noto-cjk && \
    locale-gen ja_JP.UTF-8

# ロケールの生成（※重複する場合は不要）
RUN locale-gen ja_JP.UTF-8

# 日本語言語パックと入力メソッドのインストール
RUN apt update -y && \
    apt install -y language-pack-ja ibus-mozc

# ─────────────────────────────
# Google Chromeのリポジトリ設定とインストール
# ─────────────────────────────
RUN mkdir -p /etc/apt/keyrings && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google-chrome.gpg && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

RUN apt update -y && apt-get install -y google-chrome-stable

# chromeの実行時にrootで起動するためのオプション（--user-data-dir --test-type --no-sandbox）を
# 起動スクリプトのexec行に付加する方法
# RUN sed -i 's|exec -a "\$0" "\$CHROME_BIN" "\$@"|exec -a "\$0" "\$CHROME_BIN" "\$@" --user-data-dir --test-type --no-sandbox|' /opt/google/chrome/google-chrome
RUN sed -i 's|exec -a "$0" "$HERE/chrome" "$@"|exec -a "$0" "$HERE/chrome" "$@" --user-data-dir --test-type --no-sandbox|' /opt/google/chrome/google-chrome

# VNC の設定
RUN touch /root/.Xauthority
COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

# install `uv`
RUN curl -LsSf https://astral.sh/uv/install.sh | sh


EXPOSE 5901 6080
VOLUME ["/data"]

CMD ["/startup.sh"]