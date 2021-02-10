# MediaWiki
Disability MediaWiki

## Requirement 
1. Docker machines
2. Docker compose 

## Docker commands
```javascript
    docker-compose up -d
    docker-compose logs -f
    docker-compose stop
    docker-compose down
    docker-compose down --volumes
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
ssh -At broker@wdaqua.univ-st-etienne.fr dd07078u@disabilitywiki
passord : password
docker exec -i -t 6ef933df9481 /bin/bash | enter to shell
docker cp 6ef933df9481:/var/www/html/LocalSettings.php . | Copy file
```

## References
 [Configuration Reference](https://github.com/wmde/wikibase-docker/blob/master/README-compose.md)

 [Update Reference](hhttps://addshore.com/2019/01/wikibase-docker-mediawiki-wikibase-update/)

