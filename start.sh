#!/usr/bin/env bash

# destroy vms without prompt
destroy_vms() {
    echo "--------------------------destroy vagrant vms"
    vagrant destroy -f

    echo "--------------------------make sure vms destroyed"
    vagrant status
}


echo "--------------------------testing role by vagrant"
vagrant up --provision

destroy_vms=$1

if [ "$destroy_vms" == "true" ]; then
    destroy_vms
else
    # let user choose to destroy vms
    read -t 3 -p "will you like to destroy vms created by vagrant to save resources?[default: no, enter 'y' or 'yes' to confirm]: " is_destroy

    if [ "$is_destroy" == "y" ] || [  "$is_destroy" == "yes" ]; then
        destroy_vms
    else
        echo -e "\nremain vms"
    fi
fi

