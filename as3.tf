#
# Deploy the demo app on the BIG-IP using AS3
#
provider "bigip" {
  alias    = "bigip1"
  address  = "${var.bigipaddress}"
  username = "${var.bigipuser}"
  password = "${var.bigippassword}"
}

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


