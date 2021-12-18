# MediaWiki
Disability MediaWiki

## Requirement 
1. Docker machines
2. Docker compose 

## Start
1. docker-compose up -d
2. $sudo chmod +x script
3. sudo ./script 

## optional
You can run script directly inside docker container by accesing it
```bash
    sudo docker exec -i -t 5afed752540b /bin/bash
```
change the docker id. (to see all docker id, type $docker ps)

## Docker commands
```javascript
    docker-compose up -d
    docker-compose logs -f
    docker-compose stop
    docker-compose down
    docker-compose down --volumes
	docker rmi $(docker images -a -q)
``` 
## Wikibase-docker image details 

This repo contains [Docker](https://www.docker.com/) images needed to setup a local Wikibase instance and a query service.

Each image contained within this repo has its own README with more detailed information:

Image name               | Description   | README
------------------------ | ------------- | ----------
[`wikibase/wikibase`](https://hub.docker.com/r/wikibase/wikibase) | MediaWiki with the Wikibase extension| [README](https://github.com/wmde/wikibase-docker/blob/master/wikibase/README.md)
[`wikibase/wdqs`](https://hub.docker.com/r/wikibase/wdqs) | Blazegraph SPARQL query service backend | [README](https://github.com/wmde/wikibase-docker/blob/master/wdqs/README.md)
[`wikibase/wdqs-proxy`](https://hub.docker.com/r/wikibase/wdqs-proxy) | Proxy to make the query service READONLY and enforce query timeouts | [README](https://github.com/wmde/wikibase-docker/blob/master/wdqs-proxy/README.md)
[`wikibase/wdqs-frontend`](https://hub.docker.com/r/wikibase/wdqs-frontend) | UI for the SPARQL query service | [README](https://github.com/wmde/wikibase-docker/blob/master/wdqs-frontend/README.md)
[`wikibase/quickstatements`](https://hub.docker.com/r/wikibase/quickstatements) | UI to add data to Wikibase | [README](https://github.com/wmde/wikibase-docker/blob/master/quickstatements/README.md)



## Access services

* Wikibase @ http://localhost:8181
* Query Service UI @ http://localhost:8282
* Query Service Backend (Behind a proxy) @ http://localhost:8989/bigdata/
* Quickstatements @ http://localhost:9191    
	


## Interacting with Wikibase
To gain access to admin account, default Username "WikibaseAdmin", Password "WikibaseDockerAdminPass".

You can change the user credintial details on `docker-compose.yml` file where environment variables are defined for **wikibase/wikibase:1.35-bundle** host:
*  MW_ADMIN_NAME=WikibaseAdmin
*  MW_ADMIN_PASS=WikibaseDockerAdminPass.


## SSH COMMANDS
``` 
docker exec -i -t 6ef933df9481 /bin/bash | enter to shell
docker cp 6ef933df9481:/var/www/html/LocalSettings.php . | Copy file
docker cp 02c9a6dde3db:/wdqs/runUpdate.sh . | Copy run update file
docker cp 65f36684a7f5:/var/www/html/includes/DefaultSettings.php .
```

## DOCKER COMMANDS
```
kill all running containers with docker kill $(docker ps -q)
delete all stopped containers with docker rm $(docker ps -a -q)
delete all images with docker rmi $(docker images -q)
update and stop a container that is in a crash-loop with docker update --restart=no && docker stop
bash shell into container docker exec -i -t /bin/bash - if bash is not available use /bin/sh
bash shell with root if container is running in a different user context docker exec -i -t -u root /bin/bash
change_docker_path=C:\ProgramData\Docker\config
docker system prune -a //DELETE ALL CONTAINERS
docker images -a
docker rmi Image Image
docker rmi $(docker images -a -q)

```

## Quick statements
1. Create a application auth with http://localhost:8181/wiki/Special:OAuthConsumerRegistration
2. Approve the request on http://localhost:8181/wiki/Special:OAuthManageConsumers/proposed
3. call back url http://localhost:9191/api.php

## References
 [Configuration Reference](https://github.com/wmde/wikibase-docker/blob/master/README-compose.md)

 [Update Reference](hhttps://addshore.com/2019/01/wikibase-docker-mediawiki-wikibase-update/)

./runUpdate.sh -h http://$WDQS_HOST:$WDQS_PORT -- --wikibaseUrl $WIKIBASE_SCHEME://$WIKIBASE_HOST --conceptUri $WIKIBASE_SCHEME://$WIKIBASE_HOST --entityNamespaces $WDQS_ENTITY_NAMESPACES -s 1613401544000


