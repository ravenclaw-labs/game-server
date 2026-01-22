#!/bin/bash
set -e

echo ">>> Atualizando / instalando Valheim Dedicated Server"

steamcmd \
  +login anonymous \
  +force_install_dir /home/steam/server \
  +app_update 896660 validate \
  +quit

echo ">>> Iniciando Valheim Server"

cd /home/steam/server

exec ./valheim_server.x86_64 \
  -name "${SERVER_NAME}" \
  -port ${PORT_GAME} \
  -world "${WORLD_NAME}" \
  -password "${SERVER_PASSWORD}" \
  -public ${SERVER_PUBLIC} \
  -savedir /home/steam/saves \
  -logfile /home/steam/logs/valheim.log
