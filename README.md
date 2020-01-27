# 2020H-CR460-terraform-3
## Création d'un petit déploiement IaaS en plusieurs modules

### https://www.terraform.io/docs/modules/index.html

* provider.tf
  * regroupe les informations du fournisseur cloud
* compute.tf
  * regroupe les informations d'instance
* data.tf
  * sources externes
  * https://www.terraform.io/docs/configuration/data-sources.html
* variables.tf
  * Déclaration de variables internes
  * https://www.terraform.io/docs/configuration/variables.html
* output.tf
  * présente une information suite à la création de l'infrastructure
