#!/bin/sh

BOOT2DOCKER_PATH=/var/lib/boot2docker

echo "copying bootsync.sh to boot2docker path: ${TOOLS_HOME}/trust-registry-sub/bootsync.sh to ${BOOT2DOCKER_PATH}"
sudo cp ${TOOLS_HOME}/trust-registry-sub/bootsync.sh ${BOOT2DOCKER_PATH}/

if [ $? -ne 0 ]; then
  echo "error!"
  exit 1
fi

echo "getting certificate from the registry..."
openssl s_client -connect ${1} -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM | sudo tee -a ${BOOT2DOCKER_PATH}/server.pem

if [ $? -ne 0 ]; then
  echo "error!"
  exit 1
fi

echo "executing bootsync.sh..."
sudo chmod 755 ${BOOT2DOCKER_PATH}/bootsync.sh

if [ $? -ne 0 ]; then
  echo "error! chmod"
  exit 1
fi

sudo ${BOOT2DOCKER_PATH}/bootsync.sh

if [ $? -ne 0 ]; then
  echo "error! execution"
  exit 1
fi
