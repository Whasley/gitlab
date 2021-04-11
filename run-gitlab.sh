#!/bin/bash

WORK_DIR=$(pwd)
source $WORK_DIR/gitlab-opts.sh
sudo docker run --detach \
  --hostname $HOSTNAME \
  --env GITLAB_OMNIBUS_CONFIG="external_url '$HTTP_URL/'; gitlab_rails['lfs_enabled'] = true;" \
  --publish 8084:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume $WORK_DIR/config:/etc/gitlab \
  --volume $WORK_DIR/logs:/var/log/gitlab \
  --volume $WORK_DIR/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
