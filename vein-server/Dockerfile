FROM cm2network/steamcmd:root

ENV USER steam
ENV HOME /home/steam
WORKDIR ${HOME}

RUN apt-get update && \
    apt-get install -y lib32gcc-s1 lib32stdc++6 && \
    useradd -m steam && \
    chown -R steam:steam ${HOME}

USER steam

RUN ./steamcmd.sh +login anonymous \
    +force_install_dir ${HOME}/server \
    +app_update 2430930 validate \
    +quit

WORKDIR ${HOME}/server
