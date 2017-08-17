set -ex

/home/vagrant/k8s-keystone-auth/bin/k8s-keystone-auth  \
  --tls-cert-file /var/run/kubernetes/apiserver.crt \
  --tls-private-key-file /var/run/kubernetes/apiserver.key \
  --keystone-policy-file /home/vagrant/config/policy.json \
  --keystone-url http://os_url/identity/v3 
