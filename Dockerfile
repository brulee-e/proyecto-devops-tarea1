# imagen base de Nginx
FROM nginx:alpine

LABEL description="Servicio web estatico de reserva de horas medicas (proyecto DevOps IACC)"
LABEL version="1.0.0"

# se eliminan los archivos por defecto de Nginx y se copian los del sitio
RUN rm -rf /usr/share/nginx/html/*
COPY src/ /usr/share/nginx/html/

EXPOSE 80

# verifica cada 30 segundos que Nginx siga respondiendo
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
