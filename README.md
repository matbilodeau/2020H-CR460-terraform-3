# 2021- devoir cr460
## Création d'un petit déploiement IaaS en plusieurs modules

### Pour plus d'information : https://www.terraform.io/docs/modules/index.html

Ce projet est composé en plusieurs ressources pour mieux comprendre et faire un ségrégation des parties d'un infrastructure.
* provider.tf
  * informations du fournisseur cloud
* compute.tf
  *  informations d'instance
* data.tf
  * sources externes
  Pour plus d'information : https://www.terraform.io/docs/configuration/data-sources.html
* variables.tf
  * Déclaration de quelques variables a internes
  * https://www.terraform.io/docs/configuration/variables.html
* output.tf
  * c'est une confirmation que l'instance a été crée

*network.tf 
  * informations du réseau principales et des sous-réseaux.
