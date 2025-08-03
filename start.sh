#!/bin/bash

echo "🎙️ Iniciando Lex Radio Server..."
echo "📡 Puerto: 8000"
echo "🎵 Mountpoint: /lexradio"
echo "🌐 Ubicación: Costa Rica"

# Configurar variables de entorno si están disponibles
if [ ! -z "$SOURCE_PASSWORD" ]; then
    sed -i "s/LEX_SOURCE_PASS/$SOURCE_PASSWORD/g" /etc/icecast2/icecast.xml
    echo "✅ Password de fuente configurado"
fi

if [ ! -z "$ADMIN_PASSWORD" ]; then
    sed -i "s/LEX_ADMIN_PASS/$ADMIN_PASSWORD/g" /etc/icecast2/icecast.xml
    echo "✅ Password de admin configurado"
fi

if [ ! -z "$RELAY_PASSWORD" ]; then
    sed -i "s/LEX_RELAY_PASS/$RELAY_PASSWORD/g" /etc/icecast2/icecast.xml
    echo "✅ Password de relay configurado"
fi

# Crear directorios necesarios
mkdir -p /var/log/icecast2
chmod 755 /var/log/icecast2

echo "🚀 Arrancando servidor Icecast para Lex Radio..."
echo "📻 ¡Lex Radio está listo para transmitir!"

# Iniciar Icecast en foreground para que no se cierre el contenedor
icecast2 -c /etc/icecast2/icecast.xml -b
