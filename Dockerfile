FROM ubuntu:18.04

RUN apt update && apt-get install -y openssh-server && apt-get install -y makepasswd
RUN mkdir /opt/stand   
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN service ssh restart

RUN apt-get install -y minicom
# hardware flow control?
# RUN minicom -D /dev/ttyUSB0
