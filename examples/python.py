import requests
import yaml

response = requests.get(
    'https://raw.githubusercontent.com/Lens10/datatrue-whitelist/master/'
    'whitelist.yml')

regions = yaml.load(response.text)
all_addresses = [item for sublist in regions.values() for item in sublist]
for address in sorted(all_addresses):
    print(address)
