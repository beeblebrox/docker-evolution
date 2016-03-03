#!/usr/bin/env bash
sudo usermod -u ${uid} developer || "Failed to change uid."
sudo groupmod -g ${gid} developer || echo "Failed to change gid."
sudo usermod -g ${gid} developer || echo "Failed to change developer's group to developer"
echo "Running evolution as uid ${uid} and gid ${gid}"
sudo -i -u developer /usr/bin/evolution

