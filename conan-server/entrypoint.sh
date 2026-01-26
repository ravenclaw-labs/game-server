#!/bin/bash
set -e

echo "=== Conan Exiles custom entrypoint ==="

CONAN_BASE="/conanexiles/ConanSandbox/Saved/Config/WindowsServer"
CUSTOM_CONFIG="/data/serverfiles/ServerSettings.ini"

echo "Criando diretório de configuração do Conan..."
mkdir -p "$CONAN_BASE"

if [ -f "$CUSTOM_CONFIG" ]; then
  echo "Aplicando ServerSettings.ini customizado"
  cp "$CUSTOM_CONFIG" "$CONAN_BASE/ServerSettings.ini"
else
  echo "Nenhum ServerSettings.ini custom encontrado, usando padrão"
fi

echo "Delegando para entrypoint original do container..."
exec /usr/bin/supervisord -c /etc/supervisord.conf
