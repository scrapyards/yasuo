set -ex 

kube-apiserver \
  --etcd-servers=http://127.0.0.1:2379 \
  --service-cluster-ip-range=10.0.0.0/16 \
  --authentication-token-webhook-config-file=/home/vagrant/config/webhook.kubeconfig \
  --authorization-mode=Webhook \
  --authorization-webhook-config-file=/home/vagrant/config/webhook.kubeconfig

