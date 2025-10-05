FROM alpine:3.18

# Gerekli araçları kur
RUN apk add --no-cache git inotify-tools docker-cli

# Script dosyasını kopyala
COPY watch-config.sh /usr/local/bin/watch-config.sh

# Scripti çalıştırılabilir yap
RUN chmod +x /usr/local/bin/watch-config.sh

# Default komut
CMD ["/usr/local/bin/watch-config.sh"]
