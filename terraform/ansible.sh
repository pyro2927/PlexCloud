#!/bin/bash
ansible-playbook --inventory-file=$(which terraform-inventory) ../provisioning/playbook.yml