FROM ubuntu:18.04

RUN apt update && apt-get install -y openssh-server && apt-get install -y telnetd
RUN mkdir /var/run/sshd   
RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN service ssh restart

RUN apt-get install -y minicom
# hardware flow control?
# RUN minicom -D /dev/ttyUSB0

EXPOSE 2222 50000 50001

#ENTRYPOINT exec /var/run/sshd/addusers
#CMD ["/usr/sbin/sshd", "-D"]
