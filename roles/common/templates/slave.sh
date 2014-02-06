# /bin/bash

LOCAL_PORT={{ tunnel_local_port }}
ENDPOINT=127.0.0.1

echo "Redis is slave of $ENDPOINT:$LOCAL_PORT"
redis-cli slaveof ENDPOINT $LOCAL_PORT