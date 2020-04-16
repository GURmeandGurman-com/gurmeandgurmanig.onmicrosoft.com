#!/bin/bash

# precondiciones para conectarse a internet

## alistar router de ser necesario
readonly AUTH_NODE='secure.etecsa.net'
readonly AIROS_DEVICE_IP=${1?"Especifique la ip del router AirOS"}
# readonly AIROS_PASSWORD=''  
# si el dispositivo AirOS no está disponible se imprime un mensaje y se sale
timeout 2 ping -c 1 $AIROS_DEVICE_IP &> /dev/null || {
  echo -n "ERROR: Router inalcanzable" 1>&2
  exit 1
}
# si el portal está disponible no se hace nada y se sale
timeout 2 ping -c 1 $AUTH_NODE &> /dev/null && {
  echo -n 'Router listo'
  exit 0
}
# de no estar disponible el portal se renova la ip WAN del dispositivo AirOS, se imprime un mensaje y se sale
# sshpass -p $AIROS_PASSWORD ssh "ubnt@$AIROS_DEVICE_IP" -- "udhcpc -f -q -n -i ath0 -s /etc/udhcpc/udhcpc renew" > /dev/null 2>&1 && {
ssh -o 'ConnectTimeout=2' \
    -o 'BatchMode=yes' \
    -o 'UserKnownHostsFile=/dev/null' \
    -o 'StrictHostKeyChecking=no' \
    "ubnt@$AIROS_DEVICE_IP" -- \
    "udhcpc -f -q -n -i ath0 -s /etc/udhcpc/udhcpc renew" > /dev/null 2>&1 && {
  echo -n "Router listo, ip renovada"
  exit 0
}

# de no poderse renovar la ip WAN del dispositivo AirOS se imprime un mensaje y se sale
echo -n "ERROR: No se pudo renovar la ip del router" 1>&2
exit 2