FROM mcr.microsoft.com/devcontainers/python:3.8

COPY environment.yml .
COPY configure-env.sh .

# configure aws environment
RUN sh configure-env.sh $keyId $keyValue
# install conda environment
# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh
RUN sh Miniconda3-py38_23.1.0-1-Linux-x86_64.sh -b -p /root/miniconda3 
RUN rm -f Miniconda3-py38_23.1.0-1-Linux-x86_64.sh
RUN eval "$(/root/miniconda3/bin/conda shell.sh hook)"
RUN /root/miniconda3/bin/conda env create -f environment.yml
