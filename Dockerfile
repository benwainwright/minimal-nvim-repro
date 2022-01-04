FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git
RUN git clone https://github.com/neovim/neovim && \
    cd neovim && \
    git checkout stable && \
    make && \
    make install

COPY init.lua /root/.config/nvim/
COPY plugins.lua /root/.config/nvim/lua/
RUN  nvim +PackerInstall +qall
RUN  nvim +PackerCompile +qall
