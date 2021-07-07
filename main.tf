# Create multiple VCN's
resource "oci_core_vcn" "test_vcn" {
  count          = var.number_resources
  compartment_id = var.compartment_ocid
  cidr_blocks    = ["10.${count.index}.0.0/16"]
  display_name   = "${var.prefix_names}_VCN_${count.index}"
}

# Create multiple subnets (one for each VCN)
resource "oci_core_subnet" "test_subnet" {
  count          = var.number_resources
  cidr_block     = "10.${count.index}.1.0/24"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.test_vcn[count.index].id
  display_name   = "${var.prefix_names}_subnet_${count.index}"
}

# Extract the current AD from the region
data "oci_identity_availability_domains" "test_availability_domains" {
  compartment_id = var.compartment_ocid
}
