# Create a secret to be used as the MySQL DB password
kubectl create secret generic -n wordpress mysql-pass --from-literal=password=some_secure_password

# Create the namespace
kubectl apply -f namespace.yaml

# Create MySQL
kubectl apply -f mysql.yaml
# Wait for it to be running
kubectl -n wordpress get pods

# Create the Wordpress deployment
kubectl apply -f storage.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Get the external IP for the Load Balancer
# Minikube can only do Type: NodePort on the service
kubectl -n wordpress get svc

# Delete everything, make sure you include the namespace!
kubectl -n wordpress delete svc,deploy,pvc --all
kubectl delete ns/wordpress



# Helm demo
helm init
helm install stable/wordpress

# Operator demo
kubectl apply -f ../../prometheus-operator/bundle.yaml