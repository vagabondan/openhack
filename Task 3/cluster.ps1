#Shows nodes
&"C:\Program Files (x86)\kubectl.exe" get nodes -o wide

#Create cluster with replicas
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\deployment.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\deployment.yaml"

&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\statefull.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\statefull.yaml"

#Shows rollout progress
&"C:\Program Files (x86)\kubectl.exe" rollout status deployment/minecraft-deployment
&"C:\Program Files (x86)\kubectl.exe" rollout history deployment/minecraft-deployment

#Shows deployments
&"C:\Program Files (x86)\kubectl.exe" get deployments
&"C:\Program Files (x86)\kubectl.exe" describe deployments

&"C:\Program Files (x86)\kubectl.exe" get statefulsets

#Shows pods
&"C:\Program Files (x86)\kubectl.exe" get pods -o wide --show-labels
&"C:\Program Files (x86)\kubectl.exe" describe pods minecraft

#Update image in cluster
&"C:\Program Files (x86)\kubectl.exe" set image statefulset/web minecraft=openhack/minecraft-server:2.0

#Shows ReplicaSet and update status
&"C:\Program Files (x86)\kubectl.exe" get rs

#Create service in cluster
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\service.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\service.yaml"

#Shows service information
&"C:\Program Files (x86)\kubectl.exe" get svc minecraft
&"C:\Program Files (x86)\kubectl.exe" describe svc minecraft

#Create OMS monitoring
#To retrieve these values, Select OMS Workspace from the container solutions left-hand menu. Select Advanced settings and take note of the WORKSPACE ID and the PRIMARY KEY.

#Create Kubernetes secret
#&"C:\Program Files (x86)\kubectl.exe" create secret generic omsagent-secret --from-literal=WSID=874100cf-e05c-4e76-ad1c-fad75cb8af5a --from-literal=KEY=yDEVGwZEmDPB0uR5wSiJRGr6lifprMaaTOmd5T0Ef7ccgQq/DZ7vvh60MxxsYEsccLQHAqreuXS/IgvXjG1tow==

#&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\oms-daemonset.yaml"

#&"C:\Program Files (x86)\kubectl.exe" get daemonset


#Create monitoring by Grapfana
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\deploy\1.8+"

&"C:\Program Files (x86)\kubectl.exe" top node

&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\influxdb\influxdb.yaml"
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\influxdb\grafana.yaml"
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\influxdb\heapster.yaml"
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\rbac\heapster-rbac.yaml"

&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\influxdb\influxdb.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\influxdb\grafana.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\influxdb\heapster.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\rbac\heapster-rbac.yaml"

&"C:\Program Files (x86)\kubectl.exe" get svc heapster --namespace=kube-system -o yaml
&"C:\Program Files (x86)\kubectl.exe" get deployment heapster --namespace=kube-system -o yaml
&"C:\Program Files (x86)\kubectl.exe" delete svc heapster --namespace=kube-system
&"C:\Program Files (x86)\kubectl.exe" delete deployment heapster --namespace=kube-system

&"C:\Program Files (x86)\kubectl.exe" cluster-info

&"C:\Program Files (x86)\kubectl.exe" get pods --namespace=kube-system -o wide
&"C:\Program Files (x86)\kubectl.exe" get svc --namespace=kube-system -o wide
&"C:\Program Files (x86)\kubectl.exe" describe svc monitoring-influxdb --namespace=kube-system

#Disc
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\create_disk.yaml"