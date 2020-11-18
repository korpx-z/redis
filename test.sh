
set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - redis *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW Download, test connection of redis: $ANSI_RESET"
docker run -d --rm --name some-redis quay.io/ibmz/redis:5.0
docker exec -i some-redis ping

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
