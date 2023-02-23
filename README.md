# Cloud and edge - project work

## Authors

Heikki Pulli,
Arttu Janhunen,
Joel Sokkanen,
Jan Rundt,
Sebastian Sergelius,
Kristian Krok

## For fellow developers

### Prequisities

- Install [Docker](https://docs.docker.com/get-docker/)
- Install [Minikube](https://minikube.sigs.k8s.io/docs/start/) to your machine
  - Install [kubectl](https://kubernetes.io/docs/tasks/tools/) if not included in minikube installation
- Install [Helm](https://helm.sh/docs/helm/helm_install/)
- run `minikube start` and `minikube addons enable ingress`
- Kube Lens helps a lot with visualizing your deployment. Lens is free for students & small businesses. See https://k8slens.dev/
  - Alternative tool is [OpenLens](https://github.com/MuhammedKalkan/OpenLens)

### Quick start

**NB! Nextcloud does not work with Chrome! Tested working with FireFox**

- Run `helm install <desired deployment name> ./edgemess`
  - e.g. `helm install edgemess ./edgemess`
  - Or (if you aren't using helm), run the bash-script ./edgemess/nohelmstart.sh
- Run `minikube ip` -> this will be the ip where your deployment is visible
- You should be able to access your deployment in minikube ip
- Wait for the keycloak to start. This takes up to 5 minutes.
- `<minikube ip>/keycloak` as path in the browser should show keycloak frontpage.
- `<minikube ip>/` as path in browser should show Nextcloud frontpage

#### Here stops the Quick start

Currently the Nextcloud <-> Keycloak setup is not automatic.
Follow the steps in [Nextcloud keycloak setup](nextcloud-keycloak-setup.md)

### Run kube-monkey

- kube-monkey is a chaos engineering-tool that randomly shuts down pods
- install and run with Helm using [these](https://github.com/asobti/kube-monkey/blob/master/helm/kubemonkey/README.md) instructions
- Start without Helm by running the bash-script `./kubemonkey/monkey_around.sh`
- Enjoy the logs by running the command: `kubectl logs -f deployment.apps/kube-monkey --namespace=kube-system`
- Kill the monkey with: `kubectl delete -f kubemonkey/deployment.yaml`
- Please note: kube-monkey will only kill apps that have opted in to be terminated. You need to add kube-monkey-labels to the relevant .yaml-files, see instructions [here](https://github.com/asobti/kube-monkey#opting-in-to-chaos)

### Getting rid of "untrusted domains" -error with Nextcloud

1. Add your minikube ip to the `NEXTCLOUD_TRUSTED_DOMAINS` environment variable (space separated list). If you're lucky, this might work.

#### The hard way

1. Exec to the Nextcloud pod's Bash (Lens or kubectl exec..)
2. `apt-get update && apt-get upgrade && apt-get install -y nano`
3. Go to `./config` -> `nano config.php`
4. Edit the `trusted_domains` -array by appending your minikube ip to the list

```php
    'trusted_domains' =>
    array (
        0 => 'localhost',
        1 => '192.168.1.1',
        2 => '192.168.49.2'
    ),
```

5. The list is read with every request, so save and reload your page.
