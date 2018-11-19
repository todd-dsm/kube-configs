#!/usr/bin/env bash
set -x

cmName='special-config'

function createCM() {
    kubectl create configmap "$cmName" \
        --from-literal=SPECIAL_LEVEL=very \
        --from-literal=SPECIAL_TYPE=charm
}

if ! kubectl get configmaps "$cmName" > /dev/null 2>&1; then
    createCM
else
    kubectl delete configmaps "$cmName"
    createCM
fi
