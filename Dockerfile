FROM bioconductor/bioconductor_docker:RELEASE_3_14

# install mamba and add to PATH
# from https://github.com/latchbio/latch-recipes/blob/main/nf-core-rnaseq/Dockerfile
# -b allows silent installation (approve prompts)
RUN curl -L -O \
    https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh \
    && bash Mambaforge-Linux-x86_64.sh -b \
    && rm -f Mambaforge-Linux-x86_64.sh

ENV PATH="${HOME}/mambaforge/bin:${PATH}"

# install DROP
# -y agrees to install prompts
# TODO - install into seperate conda env
RUN mamba install -y -c conda-forge -c bioconda drop
