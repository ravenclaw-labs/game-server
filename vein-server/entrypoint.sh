#!/bin/bash
set -e

STEAMCMD="/home/steam/steamcmd/steamcmd.sh"
INSTALL_DIR="/home/steam/server"

echo ">>> Atualizando / instalando VEIN Dedicated Server"

set +e

$STEAMCMD \
  +force_install_dir "$INSTALL_DIR" \
  +login anonymous \
  +app_update 2430930 validate \
  +quit

STEAM_STATUS=$?
set -e

if [ "$STEAM_STATUS" -ne 0 ]; then
  echo "⚠️ Steam retornou código $STEAM_STATUS"
  echo "⚠️ VEIN Dedicated Server ainda não possui configuração pública válida."
  echo "⚠️ Mantendo container ativo."
fi

echo ">>> Estado atual: infra pronta, aguardando servidor dedicado oficial do VEIN"
tail -f /dev/null
