# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/vivid64"
	#config.vm.box = "ubuntu/wily64"
	#config.vm.box = "wily64"
	#config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/wily/current/wily-server-cloudimg-amd64-vagrant-disk1.box"
	config.vm.network :forwarded_port, guest: 2750, host: 2750
	
	config.vm.provider :virtualbox do |virtualbox|
		#boot up the ui?
		#virtualbox.gui = true

		virtualbox.memory = 5120
		virtualbox.cpus = 8
	end
	
	config.vm.provision :shell, :path => 'install.sh'
end

