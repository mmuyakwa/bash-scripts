# Disallow insecure protocols by 

# Install InSpec:

=begin
# RedHat, Ubuntu, and macOS
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec

# Windows
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project inspec
=end


# Usage:

=begin 
# run test locally
inspec exec test.rb

# run test on remote host via SSH
inspec exec test.rb -t ssh://user@hostname -i /path/to/key

# run test on remote host using SSH agent private key authentication. Requires Chef InSpec 1.7.1
inspec exec test.rb -t ssh://user@hostname

# run test on remote windows host via WinRM
inspec exec test.rb -t winrm://Administrator@windowshost --password 'your-password'

# run test on remote windows host via WinRM as a domain user
inspec exec test.rb -t winrm://windowshost --user 'UserName@domain' --password 'your-password'

# run test on docker container
inspec exec test.rb -t docker://container_id 
=end

=begin 
# Code: test.rb
describe package('telnetd') do
    it { should_not be_installed }
end

describe inetd_conf do
    its("telnet") { should eq nil }
end
=end

# Check if docker is installed
describe package('docker-ce') do
    it { should be_installed }
end

# Check if docker service is enabled and running
describe service('docker') do
    it { should be_enabled }
    it { should be_running }
end

=begin 
# Check if docker socket is listening
describe port('2375') do
    it { should be_listening }
end
=end

# Check if docker group exists
describe group('docker') do
    it { should exist }
end

# Check if user is in docker group
describe user('mmuyakwa') do
    it { should exist }
    its('groups') { should include 'docker' }
end

# Check if docker container 'portainer' is running
describe docker_container('portainer') do
    it { should exist }
    it { should be_running }
    its('repo') { should eq 'portainer/portainer-ce' }
    its('ports') { should eq '0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9000->9000/tcp, :::9000->9000/tcp, 9443/tcp' }
end

