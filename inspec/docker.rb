# Type: InSpec Profile
# Title: Docker
# Maintainer: Michael Muyakwa
# Date: 2023-11-05
#
# Controls the state of docker service and container 'portainer'
#
# Usage:
#
# inspec exec docker.rb -t ssh://user@hostname -i /path/to/key

# Check if docker is installed
describe package('docker-ce') do
    it { should be_installed }
end

# Check if docker service is enabled and running
describe service('docker') do
    it { should be_enabled }
    it { should be_running }
end

# Check if docker group exists
describe group('docker') do
    it { should exist }
end

# Check if docker container 'portainer' is running
describe docker_container('portainer') do
    it { should exist }
    it { should be_running }
    its('repo') { should eq 'portainer/portainer-ce' }
    its('ports') { should eq '0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9000->9000/tcp, :::9000->9000/tcp, 9443/tcp' }
    its('image') { should eq 'portainer/portainer-ce' }
end

# Check if user 'mmuyakwa' exists. ONLY if usewr exists, then check if user is member of group 'docker'
describe user('mmuyakwa') do
    it { should exist }
    its('groups') { should include 'docker' }
end

# Gebe alle möglichen Keys aus docker_container('portainer') aus.
#puts docker_container('portainer').methods.sort