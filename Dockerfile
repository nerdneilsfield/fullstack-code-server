From lscr.io/linuxserver/code-server:latest

LABEL maintainer="dengqi<dengqi935@gmail.com>"

RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    wget \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    zsh \
    software-properties-common \
    && add-apt-repository -y ppa:deadsnakes/ppa \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && apt-get update && apt-get install -y \
    golang-go \
    python3.12-full \
    python3.12-dev \
    python3.12-venv \
    python3.12-distutils \
    gcc-13 \
    g++-13 \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.12 1 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1 \
    && python3.12 -m pip install --upgrade pip \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x focal main' | tee /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y \
    nodejs npm \
    && npm install -g yarn pnpm \
    && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" >> /etc/apt/sources.list.d/llvm.list \
    && echo "#deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" >> /etc/apt/sources.list.d/llvm.list \
    && apt-get update && apt-get install -y \
    clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python3-clang \
    && apt-get install -y unrar unzip stow pv \
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/*

RUN apt-get update && apt-get install -y \
    libboost-all-dev \
    libeigen3-dev \
    libpcl-dev \
    libflann-dev \
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/*

EXPOSE 8443