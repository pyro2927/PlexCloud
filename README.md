# PlexCloud

![](./plex-cloud.jpg)

Wishing you could still use Amazon's storage for Plex?  Look no further!  This repo will setup Plex in the Cloud automatically!

## Why?

On December 15th, Plex announced [they would no longer be supporting Amazon Cloud Drive](https://www.plex.tv/blog/book-plex-volume-3-plex-cloud/) due to technical limitations.  This project aims to use different techniques to overcome those hurdles, as well as improving upon it by encrypting the data stored.

## Requirements

* [DigitalOcean](https://www.digitalocean.com) Account
* [Ansible](https://www.ansible.com)
* [Terraform](https://www.terraform.io)
* [Terraform-Inventory](https://github.com/adammck/terraform-inventory)

## Setup

## Running

```bash
$ cd terraform
$ terraform apply
$ ./ansible.sh
```

## Configuring

### Plex

You'll need to setup Plex to properly allow outside connections and link to your account.  In order to do that, you'll need to `ssh` tunnel to port `32400`.

```bash
$ ssh -L 32400:localhost:32400 root@IP_ADDRESS
```

Then navigate to <http://localhost:32400/web> to configure Plex.

### Sonarr

You'll want to add [an indexer](https://github.com/Sonarr/Sonarr/wiki/Supported-Indexers) to Sonarr, so it can find content.

### Couchpotato

Similar to Sonarr, you'll need to add [a search provider](http://www.htpcguides.com/configure-couchpotato-torrent-movies/) so that Couchpotato can find content.