# Terraform: Up & Running Code translated for Azure

This repo contains the code samples for the book *[Terraform: Up and Running](http://www.terraformupandrunning.com)* by
[Yevgeniy Brikman](http://www.ybrikman.com) translated for Azure.

## Quick start

*Copied verbatim from [terraform-up-and-running-code](https://github.com/brikis98/terraform-up-and-running-code)*

All the code is in the [code](/code) folder. It is organized by language (terraform, bash, ruby, etc) and within each
language, by chapter. Since this code comes from a book about Terraform, the vast majority of the code consists of
Terraform examples in the [code/terraform folder](/code/terraform).

For instructions on running the code, please consult the README in each folder, and, of course, the
*[Terraform: Up and Running](http://www.terraformupandrunning.com)* book.

## Azure

**IMPORTANT**

* All examples have been tested with Terraform 0.12.x. Code samples have been updated
  where neccessary.
* Understand the [pricing](https://azure.microsoft.com/en-ca/pricing/)
  and [free trial](https://azure.microsoft.com/en-ca/free/) pages before running any code examples.
* Azure groups resources into resource groups. Navigate to the
  [Azure Resource Groups](https://portal.azure.com/#blade/HubsExtension/BrowseResourceGroups)
  to see all resource groups. We'll create a resurce group named terraform_group to run all our resources. We have tf files to create necessary resource groups.
* Create a terraform.tfvars file in each folder when running terraform examples. The tfvars file will contain *subscription_id*, *tenant_id*, *client_id* and *client_secret*. A sample tfvars is added to [code/terraform folder](/code/terraform). To get these values follow terraform article for
  [Azure Provider](https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html). Although the article suggests setting environment variables, but setting up terraform variables makes it more visible and changeable if necessary.

## License

This code is released under the MIT License. See LICENSE.txt.
