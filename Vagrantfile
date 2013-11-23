# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	#config.vm.box = 'precise64'
	#config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
	#config.vm.box = 'raring64'
	#config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box'
	config.vm.box = 'saucy64'
	config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box'
	#config.vm.box = 'trusty64'
	#config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
	config.vm.network :forwarded_port, guest: 2750, host: 2750
	
	config.vm.provider :virtualbox do |vb|
		vb.customize ['modifyvm', :id, '--memory', '4096']
	end
	
	config.vm.provision :shell, :path => 'install.sh'
end

