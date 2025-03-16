FROM debian:bookworm-slim

RUN apt update 
RUN apt upgrade -y

RUN --mount=type=secret,id=password export PASSWORD="$(cat /run/secrets/password)" && echo "root:$PASSWORD" | chpasswd && unset PASSWORD

RUN apt install python3 -y
RUN apt install vim -y
RUN apt install curl -y
RUN apt install openssh-server -y
RUN apt install build-essential -y

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 22

RUN service ssh start
CMD ["/usr/sbin/sshd", "-D"]
