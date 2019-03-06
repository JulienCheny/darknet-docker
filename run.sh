IMAGE=darknet_cuda10
CMD=bash
#CMD=nvidia-smi
#CMD='./darknet detect cfg/yolov3-tiny.cfg yolov3-tiny.weights data/dog.jpg'

docker run --runtime=nvidia --rm -it --name $IMAGE $IMAGE $CMD

