#!/bin/sh
# Registryの証明書をdockerデーモンが参照する指定の場所にコピーします。
# Registryが自己認証をしている場合に必要です。
#
# 引数に証明書を登録するRegistryサーバをポート付きで指定してください。
# 例：hostname:5000
#
# ca.crtファイルはクライアント側の処理によってboot2docker VMの以下の場所にコピーされることを前提としています。
# /home/docker/work-in-docker-host/certs.d/ca.crt

DOCKER_HOST_CERT_PATH=/etc/docker/certs.d/${1}/

echo "creating certs file directory: ${DOCKER_HOST_CERT_PATH}"
sudo mkdir -p ${DOCKER_HOST_CERT_PATH}

if [ $? -ne 0 ]; then
  echo "error!"
  exit 1
fi

echo "copying certs file to directory: ${TOOLS_HOME}/certs.d/ca.crt to ${DOCKER_HOST_CERT_PATH}"
sudo cp ${TOOLS_HOME}/certs.d/ca.crt ${DOCKER_HOST_CERT_PATH}

if [ $? -ne 0 ]; then
  echo "error!"
  exit 1
fi

echo "linking root certificates to directory: /etc/ssl/certs/ca-certificates.crt to ${DOCKER_HOST_CERT_PATH}/ca-certificates.crt"
sudo ln -s /etc/ssl/certs/ca-certificates.crt ${DOCKER_HOST_CERT_PATH}/ca-certificates.crt

if [ $? -ne 0 ]; then
  echo "error!"
  exit 1
fi
