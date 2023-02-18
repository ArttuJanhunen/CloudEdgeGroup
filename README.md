# Cloud and edge - project work

## Authors

Heikki Pulli

Arttu Janhunen

Joel Sokkanen

Jan Rundt

### For fellow developers

#### Prequisities

- Install minikube to your machine
- Install kubectl if not included in minikube installation
- run `minikube start` and `minikube addons enable ingress`
- Docker (duh)
- Helm
- Kube Lens helps a lot with visualizing your deployment. Lens is free for students & small businesses. See https://k8slens.dev/

#### Quick start

- Run `helm install <desired deployment name> ./edgemess`
- Or (if you aren't using helm), run the bash-script ./edgemess/nohelmstart.sh
- Run `minikube ip` -> this will be the ip where your deployment is visible
- You should be able to access your deployment in minikube ip
- Wait for the keycloak to start. This takes up to 5 minutes.
- `<minikube ip>/keycloak` as path in the browser should show keycloak frontpage.
- `<minikube ip>/` as path in browser should show nextcloud frontpage
-
- **NextCloud does not work with Chrome! Tested working with FireFox**

#### Run kube-monkey

- kube-monkey is a chaos engineering-tool that randomly shuts down pods
- install and run with Helm using [these](https://github.com/asobti/kube-monkey/blob/master/helm/kubemonkey/README.md) instructions
- Start without Helm by running the bash-script `./kubemonkey/monkey_around.sh`
- Enjoy the logs by running the command: `kubectl logs -f deployment.apps/kube-monkey --namespace=kube-system`
- Kill the monkey with: `kubectl delete -f kubemonkey/deployment.yaml`
- Please note: kube-monkey will only kill apps that have opted in to be terminated. You need to add kube-monkey-labels to the relevant .yaml-files, see instructions [here](https://github.com/asobti/kube-monkey#opting-in-to-chaos)

#### Getting rid of "untrusted domains" -error with NextCloud

1. Add your minikube ip to the `NEXTCLOUD_TRUSTED_DOMAINS` environment variable (space separated list). If you're lucky, this might work.

### The hard way

1. Exec to the nextcloud pod's Bash (Lens or kubectl exec..)
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
