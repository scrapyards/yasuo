set -xe

curl -k -v -XGET \
  -H "Accept: application/json" \
  -H "Authorization: Bearer $1" \
  https://localhost:6443/api/v1/namespaces/default/pods
