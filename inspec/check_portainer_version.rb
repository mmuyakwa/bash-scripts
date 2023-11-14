# Prüfen, ob eine neue Version von Portainer verfügbar ist.

=begin 
gem install net-http
gem install json
ruby get_latest_docker_version.rb
=end


require 'net/http'
require 'json'

def get_latest_version(image_name)
  url = "https://hub.docker.com/v2/repositories/#{image_name}/tags/?page_size=100&page=1&ordering=last_updated"
  uri = URI(url)
  puts uri
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  tags = data['results'].map { |result| result['name'] }
  linux_amd64_tags = tags.select { |tag| tag.include?('linux') && tag.include?('amd64') }
  latest_version = linux_amd64_tags.first
  return latest_version
end

image_name = "portainer/portainer-ce"
latest_version = get_latest_version(image_name)
puts "Die aktuellste Docker-Version von #{image_name} für Linux 64-Bit ist #{latest_version}."