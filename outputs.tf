# output info
output "vcn_info" {
  value = [for vcn in oci_core_vcn.test_vcn : "${vcn.display_name} - ${vcn.cidr_block}"]
}

output "subnet_info" {
  value = [for subnet in oci_core_subnet.test_subnet : "${subnet.display_name} - ${subnet.cidr_block}"]
}

output "ad_info" {
  value = data.oci_identity_availability_domains.test_availability_domains.availability_domains
}
