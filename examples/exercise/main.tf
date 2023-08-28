terraform {
  required_version = ">= 0.13.5"
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = ">= 3.2.0"
    }
  }
}

# Configure the DNS Provider
provider "dns" {
  update {
    server = "127.0.0.1"
  }
}

# This module will create the dns records type a for all the json files that it can find in a directory. 
# By default it will use the directory name input-json for the place to search for all the jsons you can change it of you want.  
module "dns_updater" {
  source = "./module/dns"
  json-directory-path = "input-json"
}
