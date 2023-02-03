# Full Stack Observability (FSO) with CoolSox

**CoolSox** is a cloud-native microservices demo application that consists of a 14-tier microservices application. The application is a web-based e-commerce app where users can browse and buy socks.

**The application is used to demonstrate the use of Cisoc Full Stack Observability (FSO) and Infrastructure as Code (IaC) technologies like AppDynamics, Thousand Eyes, Intersight Workload Optimizer (IWO), Terraform, etc.**. This application works on any Kubernetes (k8s) cluster.

The CoolSox application is based on the [original open-source microservices demo from Weaveworks](https://github.com/microservices-demo).

In case of questions or comments, then please contact

- [Morten Skriver](mailto:moskrive@cisco.com)
- [Peter Charpentier](mailto:pcharpen@cisco.com)

## Features

- **[Kubernetes](https://kubernetes.io/)**: The application is designed to run on Kubernetes
- **[AppDynamics](https://www.appdynamics.com) for Application, End-User Experience, Database, and Cluster Visibility**: The Kubernetes cluster is instrumented with AppDynamics [cluster-agent](https://www.appdynamics.com/solutions/kubernetes-monitoring) to monitor the health of the entire cluster, including every node and namespace down to the container level. The cluster-agent is also used to auto-instrument the Java, NodeJS, and .Net components of the CoolSox applcation. **[Get your AppDynamics free trial here](https://www.appdynamics.com/free-trial/)**.
- **[ThousandEyes](https://www.thousandeyes.com/) for external Network Visibility and End-User Experience:** ThousandEyes [Browser Synthetics](https://www.thousandeyes.com/product/browser-synthetics) simulates users interacting with the application. ThousandEyes Cloud Agents are deployed, across the globe, to simulate these interactions and provide metrics, such as _availability_, _response time_, _latency_, _transaction times_, _errors_. **[Get your ThousandEyes free trial here](https://www.thousandeyes.com/signup/)**.
- **[Intersight Workload Optimizer (IWO)](https://www.intersight.com) for Resource Management**: IWO provides a holistic overview of your data center, both on-prem and in public cloud, and allows you to right-size your workload resources based on the applications that run on them.
- **[ThousandEyes & AppDynamics Integration](https://www.appdynamics.com/product/network-monitoring) for complete application service visibility:** ThousandEyes alerts are natively configured to trigger alerts in AppDynamics to correlate external network and user experience problems with internal application metrics.
- **Synthetic Load Generation:** The application demo comes with a background job that creates realistic usage patterns on the website using load generator(s).

## Repository Structure

This repository contains a number of directories that are used to separate the FSO with CoolSox demonstration into logical individual components.

- **application**: Contains the components directly related to the CoolSox application
  - **deploy**: Contains scripts that can be used to deploy the application onto a Kubernetes cluster
  - **src**: Contains the source required to build/re-build the application containers
- **instrumentation**: Contains te components related to deploying the instrumentation solutions (AppDynamics, ThousandEyes, IWO, etc.)

## Application Architecture

The **CoolSox application** is composed of 14 containers written in different languages that talk to each other using REST over HTTP.

| Service | Language | Description |
| ------- | -------- | ----------- |
| [front-end](./application/src/front-end/) | NodeJS | Exposes an HTTP server to serve the website, in order to track order history, etc. must a user be created and logged in. A flavor of the front-end exist which has AppDynamics Browser RUM agent included |
| order | Java / .NET Core|  |
| order-db | MongoDB | Database backend for order tier |
| payment | Go | Handles payment (mock, as not credit card are actually charged in this demo) |
| user | Go | Handles creating of retrival of user information. |
| user-db | MongoDB | Database backend for user tier |
| [catalogue](./application/src/catalogue/) | Go | Exposes the catalogue to the front-end |
| catalogue-db | MySQL | Database backend for catalogue tier |
| cart | Java | Stores the items in the user's shopping cart in MongoDB and retrieves it. |
| cart-db | MongoDB | Database backend for cart tier |
| shipping | Java | Handles shipping of orders when they are received from the orders tier |
| queue-master | Java | Controls the shipment queue |
| rabbitmq | RabbitMQ | Message queu between the shipping and queue-master tiers |

The CoolSox application has the following default users defined:

| Username | Password |
| -------- | -------- |
| user     | password |
| user1    | password |
| Eve_Berger | eve |
