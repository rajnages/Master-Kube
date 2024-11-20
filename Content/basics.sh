----------------------------------------------------------------------------------------------------------------------
#Kubernetes Overview:
Kubernetes (often abbreviated as K8s) is an open-source platform for automating the deployment, scaling, 
and management of containerized applications. It was originally developed by Google and is now maintained by 
the Cloud Native Computing Foundation (CNCF)

----------------------------------------------------------------------------------------------------------------------

#Why you need Kubernetes and what it can do
Containers are a good way to bundle and run your applications. In a production environment, 
you need to manage the containers that run the applications and ensure that there is no downtime. 
For example, if a container goes down, another container needs to start. Wouldn't it be easier if this behavior 
was handled by a system?

That's how Kubernetes comes to the rescue! Kubernetes provides you with a framework to run distributed systems resiliently. 
It takes care of scaling and failover for your application, provides deployment patterns, and more. 
For example: Kubernetes can easily manage a canary deployment for your system.

----------------------------------------------------------------------------------------------------------------------

#What Kubernetes is not
Kubernetes is not a traditional, all-inclusive PaaS (Platform as a Service) system. 
Since Kubernetes operates at the container level rather than at the hardware level, 
it provides some generally applicable features common to PaaS offerings, such as deployment, 
scaling, load balancing, and lets users integrate their logging, monitoring, and alerting solutions. 
However, Kubernetes is not monolithic, and these default solutions are optional and pluggable. 
Kubernetes provides the building blocks for building developer platforms, 
but preserves user choice and flexibility where it is importan

---------------------------------------------------------------------------------------------------------------------

#Kubernetes Components

Core Components:
A Kubernetes cluster consists of a control plane and one or more worker nodes:

#Control Plane Components
->kube-apiserver
The core component server that exposes the Kubernetes HTTP API
->etcd
Consistent and highly-available key value store for all API server data
->kube-scheduler
Looks for Pods not yet bound to a node, and assigns each Pod to a suitable node.
->kube-controller-manager
Runs controllers to implement Kubernetes API behavior.
->cloud-controller-manager (optional)
Integrates with underlying cloud provider(s)

#Worker Nodes Components
Run on every node, maintaining running pods and providing the Kubernetes runtime environment

->kubelet
Ensures that Pods are running, including their containers.
->kube-proxy (optional)
Maintains network rules on nodes to implement Services.
->Container runtime
Software responsible for running containers. Read Container Runtimes to learn more.

-----------------------------------------------------------------------------------------------------------------

#a complete guide detailing the differences between Docker, Podman, and Kubernetes
Docker:
Definition: A platform for building, running, and managing containers.
Purpose: Simplifies the creation and deployment of applications in isolated environments

Podman:
Definition: A daemonless container engine for managing OCI-compliant containers.
Purpose: Alternative to Docker with similar functionality but focuses on rootless and daemonless architecture.

Kubernetes:
Definition: An orchestration platform for managing and scaling containers across clusters.
Purpose: Automates container deployment, scaling, and operations in production.

---------------------------------------------------------------------------------------------------------------------

#Pod
A Pod in Kubernetes is the smallest deployable unit, representing a single instance of a running process in a cluster. 
It can contain one or more tightly coupled containers that share the same network namespace and storage volumes. 
Pods ensure containers work together as a logical unit for application deployment

--------------------------------------------------------------------------------------------------------------------

#Service
#What is a Service in Kubernetes?
A Service in Kubernetes is a way to connect and communicate with a group of Pods. It makes sure your app can talk to the 
right Pods, even if Pods are added, removed, or replaced. It gives a fixed name and address (like a phone number) 
to access these Pods.

#ClusterIP (default)
Definition: Exposes the Service internally within the cluster. It is accessible only from other Pods.
Example: A backend application accessed by other services in the cluster.

#NodePort
Definition: Exposes the Service on a static port on each Nodes IP, making it accessible externally through 
Example: A simple web application accessed from outside the cluster via Node's IP.

#load Balancer
Definition: Exposes the Service externally using a cloud providers load balancer.
Example: A customer-facing web app accessible globally via a cloud load balancer.

#ExternalName
Definition: Maps the Service to an external DNS name, redirecting traffic to an external resource outside the cluster.
Example: Redirecting traffic to an external database like db.example.com.

Key Notes
Selectors: Match Pods to a Service using labels.
DNS: Kubernetes assigns DNS names to Services, enabling easy access within the cluster.
Port Mapping: The targetPort maps the service to the container port.

-------------------------------------------------------------------------------------------------------------------------

#Deployments
==>Kubernetes Deployments: A Simple Guide
A Deployment in Kubernetes helps manage the running of your application. 
It makes sure that the correct number of application instances (called Pods) are running at 
all times. It also helps with updating the application without downtime, and if something 
goes wrong, it allows you to go back to a previous version.

==>Key Benefits of Kubernetes Deployments:
Automatic Updates: Deployments automatically handle updates with zero downtime.
Self-Healing: If a Pod stops working, the Deployment will create a new one.
Easy Scaling: You can change how many Pods you need based on traffic.
Version Control: You can roll back to earlier versions if needed.

==>Types of Deployments:
=>DaemonSet
What is a DaemonSet?
- A DaemonSet ensures that a copy of a pod runs on every node in your Kubernetes cluster 
  (or on a subset of nodes, if you choose).
- When a new node is added to the cluster, the DaemonSet automatically creates a pod on that node.
  Commonly used for background tasks like logging, monitoring, and system agents that need to run 
  on every node.
- Monitoring tools (e.g., Prometheus node exporter) that need to run on each node for resource 
  usage metrics.

=>StatefulSet
What is a StatefulSet?
- A StatefulSet is used to manage stateful applications, meaning applications that require 
  persistent storage or need to maintain their state across pod restarts.
- It gives each pod a unique, stable network identity (DNS name) and stable storage. This is 
  important for applications like databases, where each pod must have a consistent identity and 
  persistent storage.
- Each pod in a StatefulSet is given a unique name (e.g., myapp-0, myapp-1), which helps when 
  maintaining the state and ensuring data consistency.
- Databases (e.g., MySQL, MongoDB, Cassandra) that require stable network identifiers and 
  persistent storage.

--------------------------------------------------------------------------------------------------

