#!/bin/bash
apt-get install jq
#import enviroment variables
source qanswer_secretes.env 
export user password

#dump the wikibase content
cp nuts_2016.ttl extensions/Wikibase/ 
cd extensions/Wikibase/
php repo/maintenance/dumpRdf.php --format "nt" --flavor "full-dump" | grep "http://schema.org/about\|http://schema.org/inLanguage\|http://schema.org/isPartOf" > wikipedia_links.nt
php repo/maintenance/dumpRdf.php --format "nt" --flavor "truthy-dump" > dump_truthy.nt
cat wikipedia_links.nt dump_truthy.nt > dump.ttl
cat nuts_2016.ttl >> dump.ttl
#login to QAnswer
echo "Retriving the key ..."
request=$(curl -X POST 'http://172.17.0.1:4567/api/user/signin' -H 'Content-Type:      application/json' -d '{"usernameOrEmail": "'$user'", "password":"'$password'"}')
echo $request
token=$(echo $request | jq -r '.accessToken')
echo $token
#upload and index the dataset to QAnswer
#echo "Uploading ..."
#curl -X POST 'https://qanswer-core1.univ-st-etienne.fr/api/dataset/upload?dataset=eu' -H "Authorization: Bearer $token" -F file=@dump.nt
echo "Updating"
curl -X POST 'http://172.17.0.1:4567/api/dataset/edit?dataset=eu' -H "Authorization: Bearer $token" -F file=@dump.ttl
echo "Indexing ..."
curl -X POST 'http://172.17.0.1:4567/api/dataset/index' --data '{"dataset": "eu", "properties": ["http://purl.org/dc/elements/1.1/title","https://schema.org/name","http://www.w3.org/2004/02/skos/core#prefLabel","http://www.w3.org/2004/02/skos/core#altLabel","http://www.w3.org/2000/01/rdf-schema#label","http://www.wikidata.org/prop/direct/P1549","http://purl.org/dc/terms/identifier","http://purl.org/dc/terms/title","https://linkedopendata.eu/prop/direct/P150"], "type": ["https://linkedopendata.eu/prop/direct/P35","https://linkedopendata.eu/prop/direct/P1845"], "subclass": ["https://linkedopendata.eu/prop/direct/P302","https://linkedopendata.eu/prop/direct/P1845"]}' -H 'Content-Type: application/json' -H "Authorization: Bearer $token"
