az Login
az provider register -n Microsoft.Compute
az provider register -n Microsoft.ContainerService
az provider register -n Microsoft.Network
az provider register -n Microsoft.Storage
az group create -n democlus01 --location eastus
az aks create --resource-group democlus01 --name rbctechdemo --node-count 2 --generate-ssh-keys --node-vm-size=Standard_B2s
az aks get-credentials --resource-group democlus01 --name rbctechdemo
kubectl get nodes
kubectl apply -f VolumeClaim.yaml
# https://kubernetes.io/docs/concepts/storage/persistent-volumes/
kubectl get pv
kubectl get pvc
# https://kubernetes.io/docs/concepts/configuration/secret/
kubectl create secret generic mssql --from-literal=SA_PASSWORD="HexagonTest123$%$%"
kubectl get secrets
kubectl describe secrets/mssql
kubectl apply -f sqldeployment.yaml
kubectl get pods
kubectl describe pods <replacewithpodname>

