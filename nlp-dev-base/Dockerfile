FROM mcr.microsoft.com/devcontainers/python:3.8

WORKDIR /home/vscode

# copy dependecies
COPY environment.yml .
COPY configure-env.sh .

# configure aws environment
RUN sh configure-env.sh $keyId $keyValue
# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh
RUN sh Miniconda3-py38_23.1.0-1-Linux-x86_64.sh -b -p /home/vscode/miniconda3 
RUN rm -f Miniconda3-py38_23.1.0-1-Linux-x86_64.sh
RUN eval "$(/home/vscode/miniconda3/bin/conda shell.sh hook)"
# install conda environment
RUN /home/vscode/miniconda3/bin/conda env create -f environment.yml
