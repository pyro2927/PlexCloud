# PlexCloud

Wishing you could still use Amazon's storage for Plex?  Look no further!  This repo will setup Plex in the Cloud automatically!

## Requirements

* DigitalOcean Account
* Terraform
* Terraform-Inventory
* Ansible

## Setup

## Running

```bash
$ cd terraform
$ terraform apply
$ ./ansible.sh
```

## Configuring

You'll need to setup Plex to properly allow outside connections and link to your account.  In order to do that, you'll need to `ssh` tunnel to port `32400`.

```bash
$ ssh -L 32400:localhost:32400 root@IP_ADDRESS
```

Then navigate to <http://localhost:32400/web> to configure Plex.