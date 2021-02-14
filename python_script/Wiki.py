# from python_wikibase import PyWikibase
#
# # Authenticate with Wikibase
# py_wb = PyWikibase(config_path="config.json")
#
# # Fetch item and "coordinate location" property
# item = py_wb.Item().get(entity_id="item label")
# prop = py_wb.Property().get(entity_id="coordinate location")
#
# # Create new GeoLocation value
# value = py_wb.GeoLocation().create(1.23, 4.56)
#
# # Create GeoLocation claim
# claim = item.claims.add(prop, value)


from wikibase_api import Wikibase
# oauth_credentials = {
#     "consumer_key": "f283c30cf4271029c41ff22e26e23008",
#     "consumer_secret": "586dec3842a80a1831eaa58147d9729d8ae37aba",
#     "access_token": "63a93659533bde4cbd124ee4a6fc620b",
#     "access_secret": "a72906b51c5b80fff0c531fb47b4718ea6950ca1",
# }
# wb = Wikibase(api_url="http://localhost:8181/w/api.php", oauth_credentials=oauth_credentials)

# BOT LOGIN
login_credentials = {
    "bot_username": "WikibaseAdmin@bot_user_1",
    "bot_password": "c2c1os459jc4hirso0ff8e3hqf4gdmc0",
}
wb = Wikibase(api_url="http://localhost:8181/w/api.php", login_credentials=login_credentials)
# create item
# r = wb.entity.get("Q1")
# print(r)

# r = wb.entity.add("item2")
content = {"labels": {"en": {"language": "en", "value": "Updated label"}}}
r = wb.entity.add("Q1", content=content)
print(r)
print(r)

# https://gitlab.the-qa-company.com/
# import list ND IMPORT ONE IMPORTS ENTITY FROM WIKIDATA
# https://gitlab.the-qa-company.com/D063520/wikibaseeditor

# wIKIBASE API
# https://gitlab.the-qa-company.com/AlyHdr/kohesio-data-import
