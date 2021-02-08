# MediaWiki
Disability MediaWiki

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

