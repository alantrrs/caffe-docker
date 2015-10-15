FROM kaixhin/cuda
MAINTAINER Alan Torres <http://github.com/alantrrs>

# Install dependencies
RUN sudo apt-get update
RUN sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
RUN sudo apt-get install --no-install-recommends libboost-all-dev
RUN sudo apt-get install libatlas-base-dev 
RUN sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
RUN sudo apt-get install git

# Clone the Caffe repo 
RUN git clone https://github.com/BVLC/caffe.git /opt/caffe
WORKDIR /opt/caffe

# Build Caffe core
RUN  cp Makefile.config.example Makefile.config && \
  sed -i 's/CXX :=/CXX ?=/' Makefile && \
  make all

# Install python dependencies
RUN pip install -r python/requirements.txt

# Build Caffe python bindings and make + run tests
RUN make pycaffe

# Add binaries to path
RUN bash -c 'echo "export PATH=/opt/caffe/.build_release/tools:\$PATH" >> ~/.bashrc'