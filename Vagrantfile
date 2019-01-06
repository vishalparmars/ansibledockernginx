Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 9080

  config.vm.network "private_network", ip: "192.168.50.6"

# Use :ansible or :ansible_local to
  # select the provisioner of your choice
  config.vm.provision :ansible do |ansible|
        ansible.playbook = "ansibleprovision/playbook.yml"
  end
end
