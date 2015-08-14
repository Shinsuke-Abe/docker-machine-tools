# 概要

Docker Machineとプライベートな自己認証したRegistryの操作を少し便利にするためのシェルスクリプト群です。

# 対応環境

Mac OS Xでboot2dockerを利用して操作する場合を想定しています。

Windows環境やCent OS環境(genericドライバ)はまだ。

# 今できること

自己認証したRegistryの証明書コピーとサーバの登録。

# 使い方

`. docker-machine-tools.sh [Dockerホスト名] [Docker Trusted Registryのホスト名(ポート付き)] [証明書ファイルのパス]`

シェル内で`docker-machine env`の値をevalするので、環境変数を設定していなくてもホストができていれば動きます。

# 参考

現状散らばっている以下の公式ドキュメントの内容をひとまとめにしたシェルです。
一つ一つやるのはやっぱりめんどい。。。

Docker Registryのドメインレジストリ起動の設定
https://docs.docker.com/registry/deploying/

Docker Registryで自己認証の証明書を使う設定
https://docs.docker.com/registry/insecure/

Docker Trusted Registryの設定
https://docs.docker.com/docker-trusted-registry/configuration/
