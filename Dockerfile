# Start from a core stack version
FROM jupyter/base-notebook:latest
USER root
# Install in the default python3 environment
RUN apt-get update
RUN apt install -y curl
RUN apt install -y git
RUN apt install -y graphviz
RUN apt install -y openjdk-11-jdk
RUN git clone https://github.com/martinbuechner1/pytmextensions.git
RUN curl -LO https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-linux-amd64.tar.gz \
    && tar xvzf pandoc-2.9.2-linux-amd64.tar.gz --strip-components 1 -C /usr/local/
