# Cloud and edge - project work

## Authors

Heikki Pulli

Arttu Janhunen

Joel Sokkanen

Jan Rundt

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
* Wait for the keycloak to start. This takes up to 5 minutes.
* `<minikube ip>/keycloak` as path in the browser should show keycloak frontpage.
* `<minikube ip>/nextcloud` as path in browser should show nextcloud frontpage

#### Run kube-monkey

* kube-monkey is a chaos engineering-tool that randomly shuts down pods
* Start by running the bash-script `./kubemonkey/monkey_around.sh`
* Enjoy the logs by running the command: `kubectl logs -f deployment.apps/kube-monkey --namespace=kube-system`
<<<<<<< HEAD
* Kill the monkey with: `kubectl delete -f kubemonkey/deployment.yaml`
* Please note: kube-monkey will only kill apps that have opted in to be terminated. You need to add kube-monkey-labels to the relevant .yaml-files, see instructions [here](https://github.com/asobti/kube-monkey#opting-in-to-chaos)
