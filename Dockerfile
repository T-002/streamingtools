FROM python:3.7.4

ENV PACKAGE_NAME="streamingtools"
ENV BASE_DIR=/$PACKAGE_NAME

ENV BUILD_DIR=$BASE_DIR/_build
ENV DIST_DIR=$BASE_DIR/dist
ENV DOC_DIR=$BASE_DIR/doc

RUN  apt-get update && \
     apt-get install make -y
RUN  apt-get clean -y

RUN  mkdir -p $DOC_DIR
RUN  mkdir -p $BUILD_DIR
RUN  mkdir -p $DIST_DIR

# Copy all content into the container
COPY doc $DOC_DIR

COPY conf.py $BASE_DIR
COPY Makefile $BASE_DIR
COPY readme.rst $BASE_DIR
COPY requirements.txt $BASE_DIR

# Download and install dependencies
RUN  pip install --upgrade pip && \
     pip install --upgrade -r $BASE_DIR/requirements.txt

RUN echo 'eval $(thefuck --alias)' >> /etc/bash.bashrc

ENV PYTHONPATH=$BASE_DIR

WORKDIR $BASE_DIR
