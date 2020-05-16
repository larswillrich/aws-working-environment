FROM ubuntu:latest

ARG TERRAFORM_VER="0.12.25"

RUN apt-get update
RUN apt-get install wget unzip -y
RUN apt-get install jq -y
RUN apt-get install vim -y
RUN apt-get install git -y
RUN apt-get install fish -y

# Python
RUN apt-get install python3.7 -y
RUN apt-get install python3-venv python3-pip -y

# AWS
RUN pip3 install awscli

# terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip -P /etc/installterraform
RUN unzip /etc/installterraform/terraform_${TERRAFORM_VER}_linux_amd64.zip -d /etc/installterraform
RUN mv  /etc/installterraform/terraform /usr/local/bin/

ADD ./startup.sh /root/startup.sh

# go to dev directory and start work
RUN mkdir ~/dev
ENTRYPOINT sh /root/startup.sh