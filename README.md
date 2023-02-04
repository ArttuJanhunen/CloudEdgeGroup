# Cloud and edge - project work

## Authors

Heikki Pulli

Arttu Janhunen

### For fellow developers

#### Prequisities

* Install minikube to your machine
* Install kubectl if not included in minikube installation
* run `minikube addons enable ingress` and `minikube start`
* Docker (duh)
* Helm
* Kube Lens helps a lot with visualizing your deployment. Lens is free for students & small businesses. See https://k8slens.dev/ 

#### Quick start

* Run `helm install <desired deployment name> ./edgemess`
* Or (if you aren't using helm), run the bash-script ./edgemess/nohelmstart.sh
* Run `minikube ip` -> this will be the ip where your deployment is visible
* You should be able to access your deployment in minikube ip
* Wait for the keycloak to start. This takes approximately 5 minutes.
* `<minikube ip>/keycloak` as path in the browser should show keycloak frontpage.
* `<minikube ip>/nextcloud` as path in browser should show nextcloud frontpage
