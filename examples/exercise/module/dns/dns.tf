
locals {
  # Variable with the json fields 
  json_files = fileset("${var.json-directory-path}/", "*.json")   

  # Getting all the records a for all the jsons files 
  json_records = [ for f in local.json_files :  jsondecode(file("${var.json-directory-path}/${f}")) ]

  # Tests
  #json_records  = merge([ for f in local.json_files : jsondecode(file("input-json/${f}")) ]...)
  # key_id = flatten([
  #   for index, value in local.json_records : {
  #     "dns-entry-${index}" = value
  #     for a in value:
  #       de = a
  #   }

  # ])

}

resource "dns_a_record_set" "www" {
  for_each = {
    for index, dns in local.json_records:
      index => dns
  }
  addresses = each.value.addresses
  zone = each.value.zone
  name = "www"
  ttl = each.value.ttl
}
