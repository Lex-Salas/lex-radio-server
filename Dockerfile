FROM ubuntu:22.04

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

# Crear directorio para logs
RUN mkdir -p /var/log/icecast2 && \
    chown -R icecast2:icecast /var/log/icecast2

# Exponer puerto
EXPOSE 8000

# Comando de inicio
CMD ["/app/start.sh"]