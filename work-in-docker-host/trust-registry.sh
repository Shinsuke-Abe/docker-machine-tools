#!/bin/sh

# パスはとりあえず。。。
source ~/work-in-docker-host/docker-host.conf

SUB_SHELL_DIR=${TOOLS_HOME}/trust-registry-sub

echo "setting up registry certification file..."
. ${SUB_SHELL_DIR}/setup-registry-certificate.sh ${1}

if [ $? -ne 0 ]; then
  echo "error!"
  exit 1
fi

echo "setting up registry certification file is complete."

echo "generating bootsync shell and kick..."
. ${SUB_SHELL_DIR}/generate-bootsync.sh

if [ $? -ne 0 ]; then
  echo "error!"
  exit 1
fi

echo "generating bootsync shell and kick is complete."

echo "restarting docker daemon..."
sudo /etc/init.d/docker restart
