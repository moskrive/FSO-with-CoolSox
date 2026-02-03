# AppDynamics Cluster Agent Install using Helm

The steps described here are taken from the official [AppDynamics documentation](https://help.splunk.com/en/appdynamics-saas/infrastructure-visibility/26.1.0/monitor-kubernetes-with-the-cluster-agent/installation-overview/install-the-cluster-agent-with-helm-charts)

1. Add AppD repository to helm

    ```bash
    helm repo add appdynamics-charts https://ciscodevnet.github.io/appdynamics-charts
    helm repo add appdynamics-cloud-helmcharts https://appdynamics.jfrog.io/artifactory/appdynamics-cloud-helmcharts/
    ```

2. Create kubernetes namespace

    ```bash
    kubectl create namespace appdynamics
    ````

3. Deploy cluster agent using helm

    ```bash
    helm install -f ./helm-values.yaml "aws-cluster-agent" appdynamics-cloud-helmcharts/cluster-agent --namespace=appdynamics
    ```

