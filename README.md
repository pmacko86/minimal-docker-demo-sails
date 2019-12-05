# minimal-docker-demo-sails

The smallest possible Docker application built using Sails, defined just as a
single Dockerfile.


## Instructions for Docker

To build:
```
docker build -t minimal-docker-demo-sails .
```

To run:
```
docker run -p 1337 --name my-demo minimal-docker-demo-sails
```

To use, get the port using `docker ps` and then use `curl` (where `PORT`
specifies the port):
```
export PORT=`docker ps --filter "name=my-demo" --format "{{.Ports}}" \
  | sed -E 's/^.*:([0-9]+)-.*$/\1/'`
curl -XPOST http://localhost:$PORT/message?text=hello
curl localhost:$PORT/message
```


### Instructions for Kubernetes

First, build the image using Docker as explained above.

Then, to deploy it (note that this assumes that the image is stored in the local registry):
```
kubectl apply -f deploy-k8.yaml
```

You can delete the deployment and the service as follows:
```
kubectl delete service/minimal-docker-demo-sails \
  deployment.apps/minimal-docker-demo-sails
```
