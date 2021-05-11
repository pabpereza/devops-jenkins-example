FROM debian

RUN apt update && apt install -y git curl tmux vim stow
