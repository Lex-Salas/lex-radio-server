FROM ubuntu:22.04

# Variables de entorno para evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    icecast2 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración
COPY icecast.xml /etc/icecast2/icecast.xml
COPY start.sh /app/start.sh

# Dar permisos de ejecución
RUN chmod +x /app/start.sh

# Crear directorio para logs con permisos correctos
RUN mkdir -p /var/log/icecast2 && \
    chmod 755 /var/log/icecast2

# Crear usuario icecast si no existe
RUN useradd -r -s /bin/false icecast2 || true

# Exponer puerto
EXPOSE 8000

# Comando de inicio
CMD ["/app/start.sh"]
