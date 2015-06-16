project_path = File.dirname(__FILE__)
project_name = project_path.split('/').last

Vagrant.configure("2") do |c|
  c.vm.define "u12" do |u12|
    u12.vm.hostname = "u12"
    u12.vm.box = "hashicorp/precise64"
    u12.vm.provider :virtualbox do |p|
      p.customize ["modifyvm", :id, "--cpus", "2"]
      p.customize ["modifyvm", :id, "--memory", "2048"]
    end
  end

  c.vm.define "u14" do |u14|
    u14.vm.hostname = "u14"
    u14.vm.box = "ubuntu/trusty64"
    u14.vm.provider :virtualbox do |p|
      p.customize ["modifyvm", :id, "--cpus", "2"]
      p.customize ["modifyvm", :id, "--memory", "2048"]
    end
  end
  
  
  c.vm.synced_folder ".", "/vagrant", disabled: true
  c.vm.synced_folder ".", "/home/vagrant/#{project_name}"
  c.vm.provision "shell", path: "setup_ubuntu.sh", privileged: false



end