# MEDIAWIKI CONTAINER

## set environment variables

edit: **env.sh**

for example for: **1.42.3** version
```
MEDIAWIKI_VF="1.42.3"
```

## build

```
bash build.sh
```

## up

```
bash up.sh
```

check running containers and using ports

```
podman ps -a
```

## stop

```
bash stop.sh
```

## down

- removes containers

```
bash down.sh
``` 

## rm

- removes containers, images and volumes

```
bash rm.sh
```

# backup

## database
```
cd backup
bash db-backup.sh
```

## images
```
cd backup
bash db-images.sh
```

# restore

to set the restore a certain file, first you need to touch it, else it will restore the last one

```
touch backup/db/mediawiki-2024-10-22--14-51-26.sql
touch backup/images/images-2024-11-04--15-38-30.zip
```

## database

```
cd backup
bash db-restore.sh
```

## images

```
cd backup
bash images-restore.sh
```
