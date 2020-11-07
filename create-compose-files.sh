#!/bin/sh

# Path to backup location
backup_dir="$HOME/compose-backups"

sudo docker pull volcan96/docker-autocompose
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
sudo docker ps --format '{{.Names}}' > containers.txt
while IFS="" read -r p || [ -n "$p" ]
do
  sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock volcan96/docker-autocompose $p > "$backup_dir/$p-$current_time.yaml"
done < containers.txt
find "$backup_dir" -name "*.yaml" -mtime +5 -exec rm {} \;
ls -acl "$backup_dir";
