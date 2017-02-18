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
