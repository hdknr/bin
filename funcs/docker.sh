DOCKER_RM_CONTAINERS(){
  docker ps -aq | xargs docker rm
}

DOCKER_RM_IMAGES() {
  docker images -aq | xargs docker rmi

}

DOCKER_RM_NONE_IMAGES() {
  docker rmi $(docker images -a --filter "dangling=true" -q)
}

DOCKER_LS_IMAGES() {
  docker images -aq 
}
