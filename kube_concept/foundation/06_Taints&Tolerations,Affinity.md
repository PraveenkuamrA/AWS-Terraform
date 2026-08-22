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


# Affinity 

Affinity also similar to taints & toleration, Here we use labels and selector to schedule a POD ( labels on worker node and affinity on POD)

Here label changes won't affect existing PODS

### requiredDuringSchedulingIgnoredDuringExecution --> Make sure to schedule the POD on the matching node (only lable is matching with the node). 

### preferredDuringSchedulingIgnoredDuringExecution --> It will prefer the label matches if label is not matching also it will schedule the POD on one of the Worker node. Here scheduling is our priority then go with this method..


## Node Affinity: The Powerhouse 🔥

Node Affinity lets you define complex rules for where your pods can be scheduled based on node labels. Think of it as creating a wishlist for your pod's ideal home!

### Key Features:
- **Flexibility**: Define precise conditions for pod placement.
- **Control**: Decide where your pods can and cannot go with greater granularity.
- **Adaptability**: Allow pods to stay on their nodes even if the labels change after scheduling.

---

## Properties in Node Affinity
- requiredDuringSchedulingIgnoredDuringExecution
- preferredDuringSchedulingIgnoredDuringExecution

## Required During Scheduling, Ignored During Execution 🛠️

This is the strictest type of Node Affinity. Here's how it works:

1. **Specify Node Labels**: Define a list of required node labels (e.g., `disktype=ssd`) in your pod spec.
2. **Exact Match Requirement**: The scheduler only places the pod on nodes with those exact labels.
3. **Execution Consistency**: Once scheduled, the pod remains on the node even if the label changes.

### Example: Targeting SSD Nodes 💾

Suppose your pod needs high-speed storage. You can create a deployment with a Node Affinity rule that targets nodes labeled `disktype=ssd`.

**YAML Configuration:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: redis
  name: redis-3
spec:
  containers:
  - image: redis
    name: redis
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
          nodeSelectorTerms:
          - matchExpressions:
              - key: disktype
                operator: In
                values:
                - ssd
```