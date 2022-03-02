FROM bioconductor/bioconductor_docker:RELEASE_3_14

# install mamba and add to PATH
# from https://github.com/latchbio/latch-recipes/blob/main/nf-core-rnaseq/Dockerfile
# -b allows silent installation (approve prompts)
RUN curl -L -O \
    https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh \
    && bash Mambaforge-Linux-x86_64.sh -b \
    && rm -f Mambaforge-Linux-x86_64.sh \
    && $HOME/mambaforge/bin/mamba init \
    && source $HOME/.bashrc

# install DROP and execute dry run on drop_demo
# -y agrees to install prompts
# TODO - install into seperate conda env?
RUN mamba install -y -c conda-forge -c bioconda drop \
    && mkdir ~/drop_demo \
    && cd ~/drop_demo \
    && drop demo \
    && snakemake --cores 1 -n
