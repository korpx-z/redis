
set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - redis *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW Download, test connection of redis: $ANSI_RESET"
docker run -i --rm --name some-redis quay.io/ibmz/redis:6.0 redis-cli
docker exec -i some-redis ping

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
