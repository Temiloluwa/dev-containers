FROM mcr.microsoft.com/vscode/devcontainers/ruby:3

# declare variables that would be passed in using --build-args
ARG keyId
ARG keyValue
ARG testVar

# set working directory
WORKDIR /home/vscode

# copy dependecies
COPY configure-env.sh .

# configure aws environment
RUN sh configure-env.sh $keyId $keyValue $testVar

# install bundler and jekyll
RUN gem install bundler jekyll
