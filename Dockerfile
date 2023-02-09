FROM ubuntu:22.04

WORKDIR /usr/deploy
COPY ./cli ./cli

RUN apt update
RUN apt install -y curl
RUN apt install sudo

ARG runner_token
ARG runner_name
ARG deploy_user_password
ENV DEPLOY_USER_PASSWORD ${deploy_user_password}
ENV RUNNER_ALLOW_RUNASROOT "1"

RUN useradd -d /usr/deploy deploy
RUN echo "deploy:${deploy_user_password}" | chpasswd -c SHA256

# Load the installer
RUN curl -o ./actions-runner-linux-x64-2.301.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.301.1/actions-runner-linux-x64-2.301.1.tar.gz
# Extract the installer
RUN tar xzf ./actions-runner-linux-x64-2.301.1.tar.gz .
# Install dependencies
RUN ./bin/installdependencies.sh
# Create the runner and start the configuration experience
RUN ./config.sh --replace --url https://github.com/CaptainOmega/test-github-workflows --token ${runner_token} --name ${runner_name}