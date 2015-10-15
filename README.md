# Caffe Docker

This contains a Docker image with GPU enabled 
[Caffe](https://github.com/BVLC/caffe) ready to go. 
The image uses [kaixhin/cuda](https://hub.docker.com/r/kaixhin/cuda/~/dockerfile/)
which creates an environment with:
- Ubuntu 14.04
- CUDA 7.5

## Host Requirements
It has only been tested on Ubuntu 14.04 and 15.04 with the following requirements: 
- [NVIDIA compatible device](http://caffe.berkeleyvision.org/installation.html#hardware)
- [CUDA 7.5](https://developer.nvidia.com/cuda-downloads) installed. (CUDA versions must match)
- [Docker](https://docs.docker.com/installation/ubuntulinux/)

## Installation

### Verify your CUDA 7.5 installation
Make sure you installed and compiled the samples, then run:
```
/usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery 
```
You should see an output like:
```
deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 7.5, CUDA Runtime Version = 7.5, NumDevs = 1, Device0 = GeForce 940M
Result = PASS
```

### Pull docker image
Image is hosted in docker hub:
```
docker pull alantrrs/caffe-docker
```

### Setup an alias
So that you don't have to pass the devices every time your run the image:
```
export NVIDIA_DEVICES="--device=/dev/nvidia0:/dev/nvidia0 --device=/dev/nvidiactl:/dev/nvidiactl --device=/dev/nvidia-uvm:/dev/nvidia-uvm"
alias dockercuda="docker run $NVIDIA_DEVICES"
```

### Test image
```
dockercuda alantrrs/caffe-docker make runtest 
```
