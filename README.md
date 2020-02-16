# bjc_linux_bootstrap

## Description
This cookbook uses kitchen to stand up a CentOS Linux instance in AWS for a student to use in the Chef InSpec Compliance Training

This cookbook is derived from
https://github.com/anthonygrees/bjc_linux_bootstrap
## Recipes

### default.rb
Bootstraps the instance to the Chef Server and Chef Automate

### run_client.rb
Runs the Chef Client on the Linux Node to take the latest cookbooks off the Chef Server

## Requirements
There are 2 items that need to be updated before the Cookbook can run.

### 1. .kitchen.yml
Update the AWS SG and Subnet

```bash
  security_group_ids: sg-99x999x99
  subnet_id: subnet-9x999999
```

### 2. validator.pem
Log on to the Chef Server in the BJC and reset the ORG validator and update the file under recipes.
