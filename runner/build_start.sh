#!/usr/bin/env bash

imagem=github-runner


# docker stop $(docker container ls -a -q --filter name=$imagem-container*)
# docker rm -f $(docker container ls -a -q --filter name=$imagem-container*)
# docker compose stop
docker compose rm -s -f
docker build --rm -t "${imagem}" .

# docker run \
#     -d \
#     --rm \
#     --name "${imagem}-container1" "${imagem}"

# docker run \
#     -d \
#     --rm \
#     --name "${imagem}-container2" "${imagem}"
docker compose up -d
