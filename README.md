# Ubuntu Dockerコンテナを作成する

- CUIのUbuntuコンテナ、GUIのUbuntuコンテナを作成するためのリポジトリ。

## 実行コマンド
```shell
docker compose up --build -d
```

## GUIに入る場合、デスクトップ環境への入り方
ブラウザで `http://localhost:3000/ ` を開けばUbuntuのGUI環境が立ち上がる。


## `uv`を使ったプロジェクトの作成方法

- pythonのバージョン：3.11
- プロジェクト名：pj_name

で作成する時

```shell
uv init -p 3.11 pj_name
```

## `uv`で`jupyter lab`を使いたいとき

[!IMPORTANT]
JupyterLabを使うときは、まず上記のプロジェクトを作成し、そのプロジェクトのディレクトリに入ってから、以下コマンドで`jupyter lab`を起動すること。例）`cd pj_name && uv run --with jupyter jupyter lab`

### **CUIの場合
```shell
uv run --with jupyter jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser
```

#### ブラウザで開く場合
すると以下のようなアドレスが表示されるので、それをブラウザで開く。

`http://127.0.0.1:8888/lab?token=974b6e73ade5c5f5e25cc799ed8b2519ca77194022054901`


#### VS Code上で開く場合

1. `Ctrl + Shift + P` または `⌘ Command + Shift + P`で、`create jupyter`と入力する。
2. `Create: New Jupyter Notebook`を選択する。
3. 作成したノートブックの右上の`Select Kernel`をクリックする。
4. `Select Another Kernel`を選択する。
5. `既存のJupyterHubサーバー...`を選択する。
6. `http://127.0.0.1:8888/lab?token=974b6e73ade5c5f5e25cc799ed8b2519ca77194022054901`のようなURLを選択できるのでそれを選ぶ。





### **GUIの場合
```shell
uv run --with jupyter jupyter lab
```

### `uv`の中の`notebook`でライブラリをインストールしたいとき

```shell
!uv add pandas
```

のように書く。


## 参考ページ：
- https://github.com/linuxserver/docker-webtop
- https://zenn.dev/mkj/articles/292a70b4f4e5e8