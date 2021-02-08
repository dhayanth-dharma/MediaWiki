# MediaWiki
Disability MediaWiki

## Requirement 
1. Docker machines
2. Docker compose 

# Docker commands
```javascript
    docker-compose up -d
    docker-compose logs -f
    docker-compose stop
    docker-compose down
    docker-compose down --volumes
``` 
    

## Interacting with Wikibase
To gain access to admin account, default Username "WikibaseAdmin", Password "WikibaseDockerAdminPass".

You can change the user credintial details on `docker-compose.yml` file where environment variables are defined for **wikibase/wikibase:1.35-bundle** host:
*  MW_ADMIN_NAME=WikibaseAdmin
*  MW_ADMIN_PASS=WikibaseDockerAdminPass.


## SSH COMMANDS
```
ssh -At broker@wdaqua.univ-st-etienne.fr dd07078u@disabilitywiki
passord : password
```

## References
 [Configuration Reference](https://github.com/wmde/wikibase-docker/blob/master/README-compose.md)

 [Update Reference](hhttps://addshore.com/2019/01/wikibase-docker-mediawiki-wikibase-update/)

