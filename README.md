# darknet-docker

## Required host dependancies

- [Driver nvidia](https://www.nvidia.fr/Download/index.aspx) (418.39 tested)
- [Cuda](https://developer.nvidia.com/cuda-downloads) (10.1 tested)
- [Docker](https://docs.docker.com/install/)
- [Docker-compose](https://github.com/docker/compose/releases)
- [Nividia-docker-v2](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))

## Install dependancies command caryall


#### Driver nvidia

```
sudo ubuntu-drivers autoinstall
```

#### Required packages

```
sudo apt-get install build-essential cmake git apt-transport-https ca-certificates curl software-properties-common
```

#### Cuda

```
sudo dpkg -i cuda-repo-ubuntu1810_10.1.105-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1810/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
```

#### Docker

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
export LSB_ETC_LSB_RELEASE=/etc/upstream-release/lsb-release
V=$(lsb_release -cs)
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${V} stable"
sudo apt update -y
sudo apt install -y docker-ce
```

#### Docker-compose

```
curl -L https://github.com/docker/compose/releases/download/1.24.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

#### Nvidia-docker-v2

```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu18.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install nvidia-docker2
sudo pkill -SIGHUP dockerd
``` 

## Docker-compose commands

```
docker-compose up -d
docker-compose exec darknet bash
docker-compose exec darknet ./darknet detect cfg/yolov3-tiny.cfg yolov3-tiny.weights data/dog.jpg
```
