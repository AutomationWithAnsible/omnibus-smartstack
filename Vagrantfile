project_path = File.dirname(__FILE__)
project_name = project_path.split('/').last

Vagrant.configure("2") do |c|
  c.vm.box = "omnibus"
  c.vm.box_url = "http://files.vagrantup.com/precise64.box"
  c.vm.hostname = "default-preciese-65.vagrantup.com"
  c.vm.synced_folder ".", "/vagrant", disabled: true
  c.vm.synced_folder ".", "/home/vagrant/#{project_name}"
  c.vm.provision "shell", path: "setup_ubuntu.sh", privileged: false


  c.vm.provider :virtualbox do |p|
    p.customize ["modifyvm", :id, "--cpus", "2"]
    p.customize ["modifyvm", :id, "--memory", "2048"]
  end
end