## Docker image with DROP installed

This [docker image](https://hub.docker.com/repository/docker/dzhang32/droper) is built upon the [bioconductor/bioconductor_docker:RELEASE_3_14](https://hub.docker.com/layers/bioconductor/bioconductor_docker/RELEASE_3_14/images/sha256-fbe8917bc3065652b3d3a1ba5b372cdc9e2c74444849674bdc26dcaeb091812c?context=explore) and has [DROP](https://github.com/gagneurlab/drop) installed. 

As `DROP` already manages it's dependencies using `conda`, the major reason for this docker is to have a stable `conda` installation and associated environment(s). For instance, this has been an issue for poorly managed, shared HPC servers, where `conda` has been reinstalled or environments removed.

## Usage

Please refer to the [DROP documentation](https://gagneurlab-drop.readthedocs.io/en/latest/installation.html) for how to run `DROP`. 

You can create a container running `bash` on the docker using: 

``` bash
docker run -it --name container_name --user rstudio dzhang32/droper:devel bash
```

Alternatively, as bioconductor dockers inherit from [rocker](https://github.com/rocker-org/rocker), you can run an R Studio server container on `droper`, for example using [rockup](https://github.com/rytenlab/rockup).
