require 'open-uri'
require 'yaml'

response = open(
  'https://raw.githubusercontent.com/Lens10/datatrue-whitelist/master/'\
  'whitelist.yml')

all_addresses = []
YAML::load(response.read).each do |_, addresses|
  all_addresses += addresses
end

def print_pattern(pattern)
    puts("^(#{pattern.chomp('|')})$")
end

max_pattern_length=125
current_pattern=''
all_addresses.sort.each do |address|
  next_address = "#{address.gsub('.', '\.')}|"
  if max_pattern_length < current_pattern.size + next_address.size
    print_pattern(current_pattern)
    current_pattern = ''
  end
  current_pattern += next_address
end
print_pattern(current_pattern)
