#!/bin/bash
set -e

SCUM_CONFIG_SRC="/home/scumserver/serverfiles/ServerSettings.ini"
SCUM_CONFIG_DST="/home/scumserver/.config/Epic/SCUM/Saved/Config/LinuxServer/ServerSettings.ini"

echo "[ENTRYPOINT] Inicializando servidor SCUM..."

# Cria diretório de config se não existir
mkdir -p "$(dirname "$SCUM_CONFIG_DST")"

# Se existir config customizada, sobrescreve
if [ -f "$SCUM_CONFIG_SRC" ]; then
  echo "[ENTRYPOINT] Aplicando ServerSettings.ini customizado"
  cp "$SCUM_CONFIG_SRC" "$SCUM_CONFIG_DST"
else
  echo "[ENTRYPOINT] Nenhum ServerSettings.ini customizado encontrado, usando padrão do jogo"
fi

# Inicia o servidor
exec ./scumserver start
