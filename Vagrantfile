domain = 'simple.intern'

Vagrant.configure("2") do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
     v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
     v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "shell", inline: 'update-locale LC_ALL="en_US.utf8"'

  config.vm.define :master do |master_config|
    master_config.vm.box = 'ubuntu/trusty64'
    master_config.vm.host_name = "salt.#{domain}"
    master_config.vm.network :private_network, ip: '10.10.10.10'
    master_config.vm.provision :shell, path: "master.sh"
    master_config.vm.synced_folder "srv/", "/srv", :nfs => true
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = 'ubuntu/trusty64'
    minion_config.vm.host_name = "minion1.#{domain}"
    minion_config.vm.network :private_network, ip: '10.10.10.11'
    minion_config.vm.provision :shell, path: "minion.sh"
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.vm.box = 'ubuntu/trusty64'
    minion_config.vm.host_name = "minion2.#{domain}"
    minion_config.vm.network :private_network, ip: '10.10.10.12'
    minion_config.vm.provision :shell, path: "minion.sh"

    minion_config.vm.post_up_message = <<-EOT

-----------------------------

    SaltBox is ready!

    Connect to master:

    $ vagrant ssh master

-----------------------------

  EOT

  end

end
