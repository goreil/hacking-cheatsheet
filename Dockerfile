# docker build -t pwncollege .
# docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d pwncollege
# docker exec -it pwncollege /bin/bash

ARG image=mcr.microsoft.com/devcontainers/base:noble
FROM $image
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y build-essential ltrace curl wget rubygems vim tmux gdb gdbserver python3 python3-pip liblzma-dev  pkg-config
RUN mkdir -p ~/miniconda3 && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh && bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && rm -rf ~/miniconda3/miniconda.sh 
RUN ~/miniconda3/bin/conda init bash
RUN . ~/.bashrc && pip3 install pwntools angr
RUN . ~/.bashrc && conda install ipython
# Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN cd /opt && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh 
RUN gem install one_gadget
RUN cd /opt && git clone --depth 1 https://github.com/junegunn/fzf.git && fzf/install
RUN /root/.cargo/bin/cargo install pwninit
