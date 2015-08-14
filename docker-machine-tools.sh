#!/bin/sh

# とりあえずは証明書とRegistryの設定のみ。
# 他のツールを作る場合はサブコマンドで切り分ける。
#
# 引数
# 第一引数:Dockerホスト名
# 第二引数:Registryホスト名(ポート付き)
# 第三引数:証明書のパス(ca.crt)

eval "$(docker-machine env $1)"

docker-machine scp -r ./work-in-docker-host ${1}:/home/docker/work-in-docker-host

docker-machine scp -r ${3} ${1}:/home/docker/work-in-docker-host/certs.d/ca.crt

docker-machine ssh ${1} chmod 755 ./work-in-docker-host/trust-registry.sh

docker-machine ssh ${1} ./work-in-docker-host/trust-registry.sh ${2}
