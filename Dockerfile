FROM bioconductor/bioconductor_docker:RELEASE_3_14

# set user to rstudio to enable DROP run via R Studio server
USER rstudio

# use bash shell rather than default /bin/sh
# from https://github.com/moby/moby/issues/7281
SHELL ["/bin/bash", "-c"]

# install mamba and initialise in PATH
# -b allows silent installation (auto approve prompts)
RUN cd ~ \
    && curl -L -O \
    https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh \
    && bash Mambaforge-Linux-x86_64.sh -b \
    && rm -f Mambaforge-Linux-x86_64.sh \
    && ~/mambaforge/bin/mamba init

ENV PATH="~/mambaforge/bin:${PATH}"

# install DROP and execute dry run on drop_demo
# -y agrees to install prompts
# TODO - install into seperate conda env?
RUN mamba install -y -c conda-forge -c bioconda drop \
    && mkdir ~/drop_demo \
    && cd ~/drop_demo \
    && drop demo \
    && snakemake --cores 1 -n

# set user back to root to allow ssh tunnel into R Studio server
USER root
