FROM bioconductor/bioconductor_docker:RELEASE_3_14

# install mambaforge and add mamba to PATH
RUN mkdir /tools \
    && cd /tools \
    && curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -o Mambaforge-Linux-x86_64.sh
    && bash Mambaforge-Linux-x86_64.sh
    && source /root/.bashrc
