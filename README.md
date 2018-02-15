# Yasuo

Install kubectl & kube-apiserver

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kube-apiserver
```

Make them both executable

```
chmod +x ./kubectl
chmod +x ./kube-apiserver
```

Install Docker

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker.ce=17.12.0~ce-0~ubuntu -y
```

Launch etcd instance

```
mkdir etcd-data
docker run --volume=$PWD/etcd-data:/default.etcd --detach --net=host quay.io/coreos/etcd > etcd-container-id
```

Modify `api.sh` so the webhook-config-file points to the correct location, and
start the kube-apiserver by executing `api.sh`.

Checkout and build: https://github.com/dims/k8s-keystone-auth

Modify `webhook.sh` to point to the correct tls files, keystone policy file,
and the keystone url, and start the webhook process by executing `webhook.sh`.

Given a valid OpenStack `openrc` file that has valid keystone credentials,
run the command:

```
  source openrc
  TOKEN=$(openstack token issue -f value -c id)
```

You should check that `$TOKEN` contains a valid keystone token via `echo`.

You can test by running the following scripts with $TOKEN as 1 argument:

* `test_kube.sh $TOKEN` runs against the kube-apiserver & webhook
* `test_wh1.sh $TOKEN`: runs test against the webhook's keystone authentication.
* `test_wh2.sh $TOKEN`: runs test against the webhook's RBAC policy.

This is quick demo of the k8s-keystone-auth project.
