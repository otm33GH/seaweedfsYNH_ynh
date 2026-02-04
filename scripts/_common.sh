#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# existing volumes index
volume_index=()
for svc in /etc/systemd/system/${app}-volume@*.service; do
    [[ -e "$svc" ]] || continue
    instance=$(basename "$svc" .service)     
    index="${instance##*@}"                  
    volume_index+=("$index")
done

# existing workers index
worker_index=()
for svc in /etc/systemd/system/${app}-worker@*.service; do
    [[ -e "$svc" ]] || continue
    instance=$(basename "$svc" .service)     
    index="${instance##*@}"                  
    worker_index+=("$index")
done
