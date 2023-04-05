FROM mcr.microsoft.com/devcontainers/python:3.8

ARG USERNAME=tobi
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

# copy dependecies
COPY environment.yml .
COPY configure-env.sh .

# configure aws environment
RUN sh configure-env.sh $keyId $keyValue
# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh
RUN sh Miniconda3-py38_23.1.0-1-Linux-x86_64.sh -b -p /root/miniconda3 
RUN rm -f Miniconda3-py38_23.1.0-1-Linux-x86_64.sh
RUN eval "$(/home/tobi/miniconda3/bin/conda shell.sh hook)"
# install conda environment
RUN /home/tobi/miniconda3/bin/conda env create -f environment.yml
