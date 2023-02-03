# AppDynamics Cluster Agent Install using Helm

The steps described here are taken from the official [AppDynamics documentation](https://docs.appdynamics.com/display/PRO21/Install+the+Cluster+Agent+with+Helm+Charts)

1. Add AppD repository to helm

    ```bash
    helm repo add appdynamics-charts https://ciscodevnet.github.io/appdynamics-charts
    ```

2. Create kubernetes namespace

    ```bash
    kubectl create namespace appdynamics
    ````

3. Deploy cluster agent using helm

    ```bash
    helm install -f ./helm-values.yaml "aws-cluster-agent" appdynamics-charts/cluster-agent --namespace=appdynamics
    ```

More information can be found on the [AppDynamics website](https://docs.appdynamics.com/display/PRO21/Configure+MongoDB+Collectors#ConfigureMongoDBCollectors-permis)
