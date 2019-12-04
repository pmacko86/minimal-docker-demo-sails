# minimal-docker-demo-sails

The smallest possible Docker application built using Sails, defined just as a
single Dockerfile.

To build:
```
docker build -t minimal-docker-demo-sails .
```

To run:
```
docker run -p 1337 --name my-demo minimal-docker-demo-sails
```

To use, get the port using "docker ps" and then use curl, such as (where PORT
specifies the port):
```
export PORT=`docker ps --filter "name=my-demo" --format "{{.Ports}}" \
  | sed -E 's/^.*:([0-9]+)-.*$/\1/'`
curl -XPOST http://localhost:$PORT/message?text=hello
curl localhost:$PORT/message
```

