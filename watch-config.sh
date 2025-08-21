#!/bin/sh

echo "✅ Gerekli araçlar kuruldu. İzleme başlatılıyor..."

while true; do
  if inotifywait -q -r -e modify,create,delete,move /config; then
    echo "🔄 Konfigürasyon değişikliği algılandı. Yeniden başlatma tetikleniyor..."
    (cd /config && git pull origin main)
    docker restart sentiric-free-user-service-1 \
                   sentiric-free-dialplan-service-1 \
                   sentiric-free-agent-service-1 \
                   sentiric-free-cdr-service-1 \
                   sentiric-free-sip-gateway-1 \
                   sentiric-free-sip-signaling-1 \
                   sentiric-free-media-service-1 \
                   sentiric-free-tts-gateway-1
  fi
  sleep 10
done
