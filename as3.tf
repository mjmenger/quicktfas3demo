#
# Deploy the demo app on the BIG-IP using AS3
#
provider "bigip" {
  alias    = "bigip1"
  address  = "${var.bigipaddress}"
  username = "${var.bigipuser}"
  password = "${var.bigippassword}"
}


#
# apply as3 configuration to the BIGIP
# change the name of the template file to try different configuration changes
#    as3_virtsvr.tmpl   - create a virtual server
#    as3_irule_scm.tmpl - create an iRule with the source retrieved from a source control repository
#    as3_irule_txt.tmpl - create an iRule with the source inline within the template
#
resource "bigip_as3" "as3-demo1" {
  provider = bigip.bigip1
  as3_json = templatefile(
    "${path.module}/as3_virtsvr.tmpl",
    {
      pool_members = jsonencode(["10.1.0.1","10.1.0.2"])
    }
  )
  tenant_name = "as3"
}


