#!/bin/bash
export WUID=$(id -u wiki)
export WGID=$(id -g wiki)
docker compose -f /opt/wiki/wiki-compose.yaml pull wiki
docker compose -f /opt/wiki/wiki-compose.yaml up --force-recreate -d