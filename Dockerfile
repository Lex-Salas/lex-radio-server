FROM moul/icecast

# Copiar configuración personalizada
COPY icecast.xml /etc/icecast2/icecast.xml

# Variables de entorno
ENV ICECAST_SOURCE_PASSWORD=LexRadio2025!
ENV ICECAST_ADMIN_PASSWORD=LexAdmin2025!
ENV ICECAST_RELAY_PASSWORD=LexRelay2025!

# Exponer puerto
EXPOSE 8000

# Comando de inicio
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
