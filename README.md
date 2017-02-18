# DataTrue Whitelist

This is a list of IP addresses that [DataTrue](https://datatrue.com/) uses to run tests.

You can use it to programmatically control access to your test environments or to
[exclude DataTrue traffic from your analytics reports] (https://support.datatrue.com/hc/en-us/articles/205540288-Exclude-DataTrue-from-your-analytics-reports).

# Using the list

The list is provided in YAML format for easy use by any programming language.

The latest file is available at
https://raw.githubusercontent.com/Lens10/datatrue-whitelist/master/whitelist.yml

The file is structured as one mapping per region with a sequence of IP
addresses. E.g.:

```yaml
region-id1:
  - a.b.c.d
  - ...
region-id2:
  - w.x.y.z
  - ...
```

This will be usually be interpreted as one array per region.  The region is the
geographical location where the IP address is located.

## Example: print full list with one address per line

### Python

```python
import requests
import yaml

response = requests.get(
    'https://raw.githubusercontent.com/Lens10/datatrue-whitelist/master/'
    'whitelist.yml')

regions = yaml.load(response.text)
all_addresses = [item for sublist in regions.values() for item in sublist]
for address in sorted(all_addresses):
    print(address)
```

### Ruby

```ruby
require 'open-uri'
require 'yaml'

response = open(
  'https://raw.githubusercontent.com/Lens10/datatrue-whitelist/master/'\
  'whitelist.yml')

all_addresses = []
YAML::load(response.read).each do |_, addresses|
  all_addresses += addresses
end

all_addresses.sort.each do |address|
  puts(address)
end
```
