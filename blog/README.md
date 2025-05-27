# EDIT CONFIG
**docker-compose.yml**

## WP CODE
```
    volumes:
      - /home/projects/blog:/app
```

## MARIADB ENV
```
    environment:
      - MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=yes
      - MYSQL_DATABASE=DB_NAME
      - MYSQL_USER=USER
      - MYSQL_PASSWORD=PASSWD
```

## NGINX
**nginx/sites/blog.conf**
```
    server_name blog.zital.eus blog.opi5;
```

# BUILD
podman-compose build --no-cache

# UP
podman-compose up -d

# STOP
podman-compose stop

# IMPORT SQL
podman exec -i CONTAINER_NAME mariadb -u USER -pPASSWD DB_NAME < ./DB.sql

# CHECK
http://localhost:8000
