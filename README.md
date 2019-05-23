# kube-configs

various kubernetes concepts - straight outta documentation

`cd ~/code/kube-configs`


## preamble

Kubernetes is like any other _popular_ opensource project: things move quickly, docs quickly go stale and examples like these change over time.

1) Check the [API Docs]; currently we recommend `1.13`. 
2) This is a group effort; if something goes stale then please help update it. 

## cloud vs minikube

The cloud is good but it costs money, no matter how little. [minikube] is free but carries with it the resource constraints of your laptop. 

Basically, all we hope to get out of minikube is cheap testing pursuant to getting the yaml files that describe the [Kubernetes Deployment].

Bonus if it creates better deployment habits.

---

## pod demo

[Generate] a deployment file:

`kubectl run kuardx --generator=run-pod/v1 --restart=Always --image=gcr.io/kuar-demo/kuard-amd64:blue -o yaml --dry-run  > ~/Downloads/temp/kuardx.yaml`

**Apply kuardx deployment**

`kubectl apply -f ~/Downloads/temp/kuardx.yaml`

**Descibe the deployment**
`kubectl get pod kuardx -o yaml`

**Kill kuardx deployment**
`kubectl delete -f ~/Downloads/temp/kuardx.yaml`

[API Docs]:https://kubernetes.io/docs/reference/
[minikube]:https://gist.github.com/todd-dsm/434b6ff7c0eda3b9d780458f27f4e818
[Kubernetes Deployment]:https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment
[Generate]:https://kubernetes.io/docs/reference/kubectl/conventions/#generators
