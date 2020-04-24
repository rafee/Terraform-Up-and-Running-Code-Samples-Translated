# Terraform "Hello, World" example

This folder contains a "Hello, World" example of a [Terraform](https://www.terraform.io/) configuration. The configuration 
deploys a single server in an [Azure account](https://azure.microsoft.com/en-us/). 

For more info, please see the preface of *[Terraform: Up and Running](http://www.terraformupandrunning.com)*.

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer. 
* You must have an [Azure account](https://azure.microsoft.com/en-us/).

Please note that this code was written for Terraform 0.12.x.

## Quick start

**Please note that this example will deploy real resources into your Azure account. We have made every effort to ensure 
all the resources qualify for the [Azure Free Tier](https://azure.microsoft.com/en-ca/free/), but we are not responsible for any
charges you may incur.** 

* Create a terraform.tfvars file when running terraform examples. The tfvars file will contain *subscription_id*, *tenant_id*, *client_id* and *client_secret*. A sample tfvars is added to [code/terraform folder](..). To get these values follow terraform article for
  [Azure Provider](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html). Although the article suggests setting environment variables, but setting up terraform variables makes it more visible and changeable if necessary. Detailed use of variables is explained later in the book.

Deploy the code:

```
terraform init
terraform apply
```

Clean up when you're done:

```
terraform destroy
```