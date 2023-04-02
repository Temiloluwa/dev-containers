FROM continuumio/miniconda3:4.9.2
# install awscli
RUN apt-get update --allow-releaseinfo-change && apt-get install -y apt-transport-https
RUN apt-get install -y curl unzip groff less wget
RUN	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN	unzip awscliv2.zip && ./aws/install

COPY environment.yml .
RUN conda env update -f environment.yml --prune
