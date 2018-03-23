#Shows nodes
&"C:\Program Files (x86)\kubectl.exe" get nodes -o wide

#Create cluster with replicas
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\deployment.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\deployment.yaml"

#Shows rollout progress
&"C:\Program Files (x86)\kubectl.exe" rollout status deployment/minecraft-deployment
&"C:\Program Files (x86)\kubectl.exe" rollout history deployment/minecraft-deployment

#Shows deployments
&"C:\Program Files (x86)\kubectl.exe" get deployments
&"C:\Program Files (x86)\kubectl.exe" describe deployments

#Shows pods
&"C:\Program Files (x86)\kubectl.exe" get pods -o wide --show-labels
&"C:\Program Files (x86)\kubectl.exe" describe pods minecraft

#Update image in cluster
&"C:\Program Files (x86)\kubectl.exe" set image deployment/minecraft-deployment minecraft=minecraft:2.0

#Shows ReplicaSet and update status
&"C:\Program Files (x86)\kubectl.exe" get rs

#Create service in cluster
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\service.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\service.yaml"

#Shows service information
&"C:\Program Files (x86)\kubectl.exe" get svc minecraft
&"C:\Program Files (x86)\kubectl.exe" describe svc minecraft

#Create monitoring by Grapfana
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\influxdb\influxdb.yaml"
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\influxdb\grafana.yaml"
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\influxdb\heapster.yaml"
&"C:\Program Files (x86)\kubectl.exe" create -f "D:\github\openhack\Task 3\rbac\heapster-rbac.yaml"

&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\influxdb\influxdb.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\influxdb\grafana.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\influxdb\heapster.yaml"
&"C:\Program Files (x86)\kubectl.exe" delete -f "D:\github\openhack\Task 3\rbac\heapster-rbac.yaml"

&"C:\Program Files (x86)\kubectl.exe" get pods --namespace=kube-system
&"C:\Program Files (x86)\kubectl.exe" get svc --namespace=kube-system