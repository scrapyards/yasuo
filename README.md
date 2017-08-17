# Yasuo


Given a valid OpenStack `openrc` file that has valid keystone credentials,
run the command:

```
  source openrc
  TOKEN=$(openstack token issue -f value -c id)
```

You should check that `$TOKEN` contains a valid keystone token via `echo`.

Modify `api.sh` so the webhook-config-file points to the correct location, and
start the kube-apiserver by executing `api.sh`.

Checkout and build: https://github.com/dims/k8s-keystone-auth

Modify `webhook.sh` to point to the correct tls files, keystone policy file,
and the keystone url, and start the webhook process by executing `webhook.sh`.

You can test by:

* Running `test_kube.sh $TOKEN`.  The script takes 1 argument as the keystone
  token.
* `test_wh1.sh`: runs test against the webhook's keystone authentication.
* `test_wh2.sh`: runs test against the webhook's RBAC policy.


This is quick demo of the k8s-keystone-auth project.

