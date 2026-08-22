# Taints and Tolerations

Taints sets on node level and Toleration sets on Pod level ( used to schedule a POD in specified woker node)

| Part   | Value        |
| ------ | ------------ |
| Key    | `GPU`   |
| Value  | `True`   |
| Effect | `NoSchedule` |

### The taint has three parts: key=value:effect 

GPU=True:NoSchedule

### Three types of effect : `NoSchedule`, `PreferNoSchedule`, `NoExecute`

`NoSchedule` --> works on only newer pods.

`PreferNoSchedule` --> No guarntee.

`NoExecute` --> will check existing pods and also newer pods. 

### Tainting a Node:

```bash
kubectl taint nodes node1 key=gpu:NoSchedule
```

This command taints node1 with the key "gpu" and the effect "NoSchedule." Pods without a toleration for this taint won't be scheduled there.

To remove the taint , you add - at the end of the command , like below.

```bash
kubectl taint nodes node1 key=gpu:NoSchedule-
```

### Adding toleration to the pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: redis
  name: redis
spec:
  containers:
  - image: redis
    name: redis
  tolerations:
  - key: "gpu"
    operator: "Equal"
    value: "true"
    effect: "NoSchedule"
```

---

### NodeSelector 

Node Selector can give access for POD's to take decision where the POD should be schdule using labels ( By checking the Node label and also first it will try to match the lable then goes to match the taints and toleration)