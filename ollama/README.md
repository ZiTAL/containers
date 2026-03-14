"ollama load balance" kontu 1 baino gehidxaugaz:

# podman / docker
```
podman-compose up -d
docker compose up -d
```

# 1go konture logie:
```
podman exec -ti ollama-bat /bin/sh
ollama login
```
linke-ra sartun eta eta **connect** jo
```
podman pull glm-5:cloud
exit
```

# 2go konture logie:
```
podman exec -ti ollama-bi /bin/sh
ollama login
```
linke-ra sartun eta eta **connect** jo
```
podman pull glm-5:cloud
exit
```

# test
```
bash test.sh
```
