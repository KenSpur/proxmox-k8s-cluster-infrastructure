#!/bin/sh

# exit when any command fails
set -e

# set defaults
mode="plan"

# map params
while [ "$1" != "" ]; do
    case $1 in
      -m | --mode)          shift
                              mode=$1
                              ;;
      * )                     echo "Invalid param: $1"
                              exit 1
    esac
    shift
done

proxmox_api_url=""
proxmox_api_token_id=""
proxmox_api_token_secret=""
ssh_key=""

case $mode in
    "plan")
        echo "Performing terraform plan"
        terraform plan \
            -var "proxmox_api_url=$proxmox_api_url" \
            -var "proxmox_api_token_id=$proxmox_api_token_id" \
            -var "proxmox_api_token_secret=$proxmox_api_token_secret" \
            -var "ssh_key=$ssh_key"
        ;;
    "apply")
        echo "Performing terraform apply"
        terraform apply \
            -var "proxmox_api_url=$proxmox_api_url" \
            -var "proxmox_api_token_id=$proxmox_api_token_id" \
            -var "proxmox_api_token_secret=$proxmox_api_token_secret" \
            -var "ssh_key=$ssh_key"    
        ;;
    "destroy")
        echo "Performing terraform destroy"
        terraform destroy \
            -var "proxmox_api_url=$proxmox_api_url" \
            -var "proxmox_api_token_id=$proxmox_api_token_id" \
            -var "proxmox_api_token_secret=$proxmox_api_token_secret" \
            -var "ssh_key=$ssh_key"
        ;;
    *)
        echo "Invalid mode: $mode"
        # Add commands to execute for invalid mode
        ;;
esac