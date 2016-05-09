# -*- mode: ruby -*-
# vi: set ft=ruby :

$build_address="192.168.50.100"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.define "build" do |build|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
    end
    build.vm.network "forwarded_port", host: 5000, guest: 5000
    build.vm.network "forwarded_port", host: 2201, guest: 22, id: "ssh", auto_correct: true
    build.vm.network "private_network", ip: "#$build_address"
    build.vm.hostname = "build"
# https://github.com/mitchellh/vagrant/issues/6793
# powinno być poprawione w vagrancie 1.8.2
#
#    build.vm.provision "ansible_local" do |ansible|
#      ansible.provisioning_path = "/vagrant/ansible"
#      ansible.playbook = "provision.yml"
#      ansible.tags = "docker,redis"
#      ansible.install = true
#      ansible.extra_vars = {
#         target: "all",
#         dns_server: "8.8.8.8"
#      }
#    end
# workaround:
    build.vm.provision "shell", privileged: true,
      inline: 'ansible-playbook --help || (apt-add-repository ppa:ansible/ansible && apt-get update && apt-get -y install ansible)'
    build.vm.provision "shell", privileged: true,
      inline: 'ansible-playbook -i "127.0.0.1," --connection=local --extra-vars "target=127.0.0.1" --tags docker,redis,pull,build,run /vagrant/ansible/provision.yml'
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
