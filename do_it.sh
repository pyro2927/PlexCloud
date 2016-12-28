#!/bin/bash
if [ ! -f ./terraform/terraform.tfvars ]; then
  echo "Missing ./terraform/terraform.tfvars file"
  exit 1
fi

if ! grep -q do_token ./terraform/terraform.tfvars; then
  echo "Missing 'do_token' from terraform.tfvars"
  exit 1
fi

if ! grep -q ssh_key_id ./terraform/terraform.tfvars; then
  echo "Missing 'ssh_key_id' from terraform.tfvars"
  exit 1
fi

if ! grep -q "CLAIM_TOKEN: claim-" ./provisioning/group_vars/all.yml; then
  echo "Missing CLAIM_TOKEN from group_vars"
  read -p "Press Enter to open claim token site, past result into ./provisioning/group_vars/all.yml"
  open "https://www.plex.tv/claim/"
  exit 1
fi

if [ ! -f ./provisioning/roles/aws/files/oauth_data ]; then
  echo "Missing 'oauth_data' from aws files"
  read -p "Press Enter to open the site for oauth_data...."
  open 'https://tensile-runway-92512.appspot.com/'
  while [ ! -f ~/Downloads/oauth_data.html ]; do
    sleep 2
  done
  echo "Automatically moving oauth_data file..."
  mv ~/Downloads/oauth_data.html ./provisioning/roles/aws/files/oauth_data
fi

pushd ./terraform/
terraform apply
while ! ansible --inventory-file=$(which terraform-inventory) -m ping all; do
  echo "Waiting for machine to come online..."
  sleep 5
done
./ansible.sh