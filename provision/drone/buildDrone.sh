sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r)
sudo apt-get install docker-engine

sudo docker pull drone/drone:0.4

sudo mkdir /etc/drone

sudo sh -c 'echo \
  "REMOTE_DRIVER=github" \
  > /etc/drone/dronerc
  && echo
  "REMOTE_CONFIG=https://github.com?client_id=45170d66a6daa6979d04&client_secret=0bbb6f7e7c155dc5e4fdb92532da18337dc9a8b9" \
  >> /etc/drone/dronerc'


sodo touch /var/lib/drone/drone.sqlite

sudo docker run \
  --volume /var/lib/drone:/var/lib/drone \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --env-file /etc/drone/dronerc \
  --restart=always \
  --publish=80:8000 \
  --detach=true \
  --name=drone \
  drone/drone:0.4

