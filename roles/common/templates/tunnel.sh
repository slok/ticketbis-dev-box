# /bin/bash

ENPOINT={{ tunnel_endpoint }}
ENDPOINT_USER={{ tunnel_endpoint_user }}
LOCAL_PORT={{ tunnel_local_port }}
ENDPOINT_PORT={{ tunnel_endpoint_port }}

echo "Listening on port $LOCAL_PORT (In background)"
ssh $ENDPOINT_USER@$ENPOINT -L $LOCAL_PORT:$ENPOINT:$ENDPOINT_PORT -N
#redis-cli slave of 127.0.0.1 6377 
