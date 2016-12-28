# Setup

A few steps are needed to prepare yourself to run these scripts.  As a start, `cp ./terraform/terraform.tfvars.example ./terraform/terraform.tfvars`.

## DigitalOcean

### Token

After creating a DigitalOcean account, you'll want to get a token from the [settings page](https://cloud.digitalocean.com/settings/api/tokens).  Place that token as `do_token` in `./terarform/terraform.tfvars`.

### SSH Key ID

Ensure you've added your public key to [your account](https://cloud.digitalocean.com/settings/security).  After that, get the key ID by issuing the following `curl` command:

```bash
$ curl -X GET -H "Authorization: Bearer API_TOKEN_HERE" "https://api.digitalocean.com/v2/account/keys"
```

You'll receive a JSON response.  Copy the `id` of the first `ssh_keys` object into the `ssh_key_id` within `./terraform/terraform.tfvars`.

## Amazon CloudDrive

### OAuth Data

In order to authenticate `acd_cli`, visit <https://tensile-runway-92512.appspot.com/> and copy the downloaded data file to `./provisioning/roles/aws/files/oauth_data` (no extension).

## Plex

### Claim Token

In order to have your server automatically claimed at startup, go to <https://www.plex.tv/claim/> and copy the token into `./provisioning/group_vars/all.yml`.  You'll want to do this as the very last setup step, as the token is only good for 5 minutes.
