# **<u>Azure AKS Kubernetes Terraform Code</u>**

## Use the following commands to run.

## Initialize

To initialize the environment

```bash
terraform init
```

## Validate

To validate the Terraform code

```
terraform validate
```

## Plan

To run a plan and save the data to a file (terraform.plan)

```
terraform plan -out terraform.plan
```

## Apply

To apply a plan and create the resources that were saved in terraform.plan 

```
terraform apply "terraform.plan"
```

## Kubectl

To connect to the Azure AKS Kubernetes cluster you need to get credentials from the resource group. Use the following command to obtain credentials. The following command assumes the resource group is named "azeus-kubaks-rg" and the cluster name is "kubaks".

```
az aks get-credentials --resource-group azeus-kubaks-rg -n kubaks
```

If you try to connect to the cluster you will be allowed to connect but not execute anything.

```
kubectl get nodes
```

`To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code XXXXXXXX to authenticate.`

`Error from server (Forbidden): nodes is forbidden: User "a1fa5930-xxxx-xxxx-xxxx-e20261a4b68a" cannot list resource "nodes" in API group "" at the cluster scope`

Your user id, and that of others who need to work on the cluster, will need to be added to the Azure Active Directory to the AAD admin group in the Azure portal. 

Navigate to “**Azure Active Directory**” ==>  “**Groups**” and select your cluster-admin group. On the left navigation, select “**Members**” and add your own Azure user ID and that of other users you wish to access the cluster.

At this point you can issue the kubectl command again 

```
kubectl get nodes 
```

and you should get output like:

`NAME                              STATUS   ROLES   AGE   VERSION`
`aks-default-12345678-vmss000000   Ready    agent   13m   v1.14.8`
`aks-default-12345678-vmss000001   Ready    agent   13m   v1.14.8`

To add the updated credentials into your local kubeconfig file execute the following command again. Note: This will require reauthentication with Azure.

```
az aks get-credentials --resource-group azeus-kubaks-rg -n kubaks
```

`A different object named clusterUser_azeus-kubaks-rg_kubaks already exists in your kubeconfig file.`
`Overwrite? (y/n): y`

`Merged "kubaks" as current context in /Users/myuserid/.kube/config`

## Destroy

To destroy the cluster and the related resources you created with Terraform use the following command.

```
terraform destroy
```









