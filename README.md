# Cloud and edge - project work

## Authors

Heikki Pulli

Arttu Janhunen

### For fellow developers

#### Prequisities

* Install minikube to your machine
* Install kubectl if not included in minikube installation
* run `minikube addons enable ingress`
* Docker (duh)
* Helm

#### Quick start

* Run `helm install <desired deployment name> ./edgemess`
* Run `minikube ip` -> this will be the ip where your deployment is visible
* You should be able to access your deployment in minikube ip, root should show 404 by NginX.
* '/keycloak' as path in the browser should show keycloak frontpage, add another '/' to fetch media
* '/nextcloud' as path in browser should show nextcloud frontpage
* Links should cause 404 by NginX, as redirecting by ingress fails
