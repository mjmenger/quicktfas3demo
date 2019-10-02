create a terraform.auto.tfvars file with the following content

```hcl
bigipaddress    = "https://<BIGIP HOST NAME>:<BIGIP MANAGEMENT PORT>"
bigipuser       = "<BIGIP USERNAME>"
bigippassword   = "<BIIP USER PASSWORD>"

by adjusting the template specified within the `as3.tf` file you can try some simple alternate as3 use cases. Inline comments in the as3.tf file provide template names.