FROM ubuntu:18.04
MAINTAINER RAHULRATHORE
ARG DEBIAN_FRONTEND=noninteractive

# install utilities
RUN apt-get update
RUN apt-get install curl gnupg -y
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh && sh ./setup_14.sh
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN git clone https://github.com/AmitXShukla/Online-School-Management-App-Angular-Firebase.git

# Install Angular CLI
RUN npm install -g @angular/cli
RUN git config --global user.email "rahulrathore010@gmail.com"
RUN git config --global user.name "Rahul-012"

WORKDIR "/mean/Online-School-Management-App-Angular-Firebase/app/client"
WORKDIR "/mean"
RUN ls
RUN ng new SMA
WORKDIR "/mean/SMA"
EXPOSE 4200
ENTRYPOINT ng serve

