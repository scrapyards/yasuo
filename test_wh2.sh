set -ex

cat << EOF | curl -kvs -XPOST -d @- https://localhost:8443/webhook | python -mjson.tool
{
    "apiVersion": "authorization.k8s.io/v1beta1",
    "kind": "SubjectAccessReview",
    "spec": {
        "resourceAttributes": {
            "namespace": "kittensandponies",
            "verb": "get",
            "group": "unicorn.example.org",
            "resource": "pods"
        },
        "user": "jane",
        "group": [
            "group1",
            "group2"
        ]
    }
}
EOF
