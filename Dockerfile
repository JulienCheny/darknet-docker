FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

# install
RUN \
	apt-get update && apt-get install -y \
	autoconf \
        automake \
	libtool \
	build-essential \
	git

# addons
RUN \
	apt-get install -y \
	wget

# build repo
RUN \
	git clone https://github.com/pjreddie/darknet # Tested with the commit 61c9d02 on 14 Sep 2018

# make
WORKDIR darknet/
RUN sed -i 's/GPU=.*/GPU=1/' Makefile && \
	make

# download yolov3 tiny weights
RUN wget https://pjreddie.com/media/files/yolov3-tiny.weights >/dev/null 2>&1

# test nvidia docker
CMD nvidia-smi -q

# defaults command
CMD ["bash"]

