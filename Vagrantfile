Vagrant.configure("2") do |config|
    config.ssh.password = "vagrant"

    config.vm.define "worker01" do |worker01|
        worker01.vm.box = './pkgs/package.box'
        worker01.disksize.size = '50GB'    
        worker01.vm.network 'private_network', ip: '192.168.56.102'
        worker01.vm.hostname = 'worker01'

        worker01.vm.provider 'virtualbox' do |vb|
            vb.gui = false
            vb.name = 'worker01'
            vb.memory = 8000
            vb.cpus = 2
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        end
    end

    config.vm.define "worker02" do |worker02|
        worker02.vm.box = './pkgs/package.box'
        worker02.disksize.size = '50GB'    
        worker02.vm.network 'private_network', ip: '192.168.56.103'
        worker02.vm.hostname = 'worker02'

        worker02.vm.provider 'virtualbox' do |vb|
            vb.gui = false
            vb.name = 'worker02'
            vb.memory = 8000
            vb.cpus = 2
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        end
    end

    config.vm.define "master01" do |master01|
        master01.vm.box = './pkgs/package.box'
        master01.disksize.size = '50GB'    
        master01.vm.network 'private_network', ip: '192.168.56.101'
        master01.vm.hostname = 'master01'

        master01.vm.provider 'virtualbox' do |vb|
            vb.gui = false
            vb.name = 'master01'
            vb.memory = 12000
            vb.cpus = 2
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        end

        master01.vm.provision "shell" do |s|
            s.path       = "install_ansible.sh"
            s.privileged = true
        end
    end
end
