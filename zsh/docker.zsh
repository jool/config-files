function dck_prune() {
    docker image prune --force
    docker container prune --force
    docker volume prune --force
    docker network prune --force
}

function dck_wipe() {
    dck_prune
    docker rmi --force $(docker images -q)
}

