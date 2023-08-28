# ----------------------------------------
# Write your Terraform module outputs here
# ----------------------------------------

output "json_files" {
    value = module.dns_updater.json_files
} 

output "records" {
    value = module.dns_updater.records
} 


# output "key_id" {
#     value = module.dns_updater.key_id
# } 

