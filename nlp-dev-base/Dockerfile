FROM mcr.microsoft.com/devcontainers/python:3.8

COPY environment.yml .
COPY configure-env.sh .

# configure aws environment
RUN sh configure-env.sh
# install conda environment
# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
RUN sh Miniconda3-latest-Linux-aarch64.sh -b -p /root/miniconda3 
RUN rm -f Miniconda3-latest-Linux-aarch64.sh
RUN eval "$(/root/miniconda3/bin/conda shell.sh hook)"
RUN /root/miniconda3/bin/conda env create -f environment.yml
