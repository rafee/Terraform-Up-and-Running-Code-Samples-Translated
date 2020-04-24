# Packer example

This folder shows an example [Packer](https://www.packer.io/) template that can be used to create an [Azure Managed
Image](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/build-image-with-packer) of an Ubuntu server with Apache, PHP, and
a sample PHP app installed.

For more info, please see Chapter 1, "Why Terraform", of 
*[Terraform: Up and Running](http://www.terraformupandrunning.com)*.

## Pre-requisites

* You must have [Packer](https://www.packer.io/) installed on your computer. 
* You must have an [Azure account](https://azure.microsoft.com/en-us/).

## Quick start

**Please note that this example will deploy real resources into your Azure account. We have made every effort to ensure 
all the resources qualify for the [Azure Free Tier](https://azure.microsoft.com/en-ca/free/), but we are not responsible for any
charges you may incur.** 
* Create a terraform.tfvars file in each folder when running terraform examples. The tfvars file will contain *subscription_id*, *tenant_id*, *client_id* and *client_secret*. A sample tfvars is added to [code/terraform folder](./code/terraform). To get these values follow terraform article for
  [Azure Provider](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html). Although the article suggests setting environment variables, but setting up terraform variables makes it more visible and changeable if necessary. Detailed use of variables is explained later in the book.

* Configure your [Azure Credentials](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html) in a variables.json file by modifying sample.json file. 

To build the AMI:
Terraform apply to create the resource group necessary for building the packer file
```
terraform init
terraform apply
```
Build packer image using the packer software
```
packer build -var-file=variables.json webserver.json
```
Clean up when you're done:

```
terraform destroy
```