FROM cm2network/steamcmd:root

ENV USER=steam
ENV HOME=/home/steam

WORKDIR ${HOME}

# Dependências 32-bit necessárias para servidores Steam
RUN apt-get update && \
    apt-get install -y lib32gcc-s1 lib32stdc++6 && \
    rm -rf /var/lib/apt/lists/*

# Garante diretório do servidor
RUN mkdir -p ${HOME}/server && \
    chown -R steam:steam ${HOME}

# Copia entrypoint já com permissão de execução
COPY --chmod=755 entrypoint.sh /entrypoint.sh

USER steam

ENTRYPOINT ["/entrypoint.sh"]
