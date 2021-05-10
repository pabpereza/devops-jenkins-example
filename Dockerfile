FROM debian

RUN echo "http://nexus.alm.europe.cloudcenter.corp/repository/apt-debian-proxy/" > /etc/apt/sources.list
RUN apt update && apt install -y git curl tmux vim stow
