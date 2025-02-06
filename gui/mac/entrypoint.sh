#!/bin/sh
set -e

# VIRTUAL_ENV を削除する
# lscr.io/linuxserver/webtopは、デフォルトでpython実行環境と
# pythonの仮想環境`VIRTUAL_ENV`を指定した状態で起動する
# そうすると`uv`が独自で指定したい`VIRTUAL_ENV`と異なるパスになってしまうため
# 警告が表示されてしまう
# それを起こさないために、`VIRTUAL_ENV`をアンセットしておく
unset VIRTUAL_ENV


# # コンテナ実行時に /config/.cache/uv の権限確認・変更
# if [ -d "/config/.cache/uv" ]; then
#   echo "Fix permissions on /config/.cache/uv"
#   # UID/GID を実行ユーザーに合わせる（abc ユーザーが走っている前提）
#   chown -R $(id -u):$(id -g) /config/.cache/uv 2>/dev/null || \
#   chmod -R 777 /config/.cache/uv
# fi

if [ -d "/config/.cache/uv" ]; then
  echo "Fixing permissions on /config/.cache"
  chown -R "$(id -u):$(id -g)" /config/.cache || true
  # 必要に応じて、さらに権限を広げる
  chmod -R 777 /config/.cache || true
fi


# 起動時に実行したいコマンド
curl -LsSf https://astral.sh/uv/install.sh | sh

# DockerfileのCMDで指定したコマンドを実行する
exec /init