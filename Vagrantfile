VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.ssh.insert_key = false
    config.vm.box_check_update = false

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "/tmp/iso/CentOS-7-x86_64-Minimal.iso"]

    end


    config.vm.define "vagrant1" do |vagrant1|
        vagrant1.vm.box = "bento/ubuntu-16.10"
        vagrant1.vm.network "private_network", ip: "192.168.168.201"
    end

    config.vm.define "vagrant2" do |vagrant2|
        vagrant2.vm.box = "bento/centos-7.1"
        vagrant2.vm.network "private_network", ip: "192.168.168.202"

        # On CentOS7, you should restart network to take effect of ip address; but you need not to do this on ubuntu-16.10

        # set preserve_order to true in order to execute as I wish.
        vagrant2.vm.provision "restart-network", type: "shell", preserve_order: true, inline: "sudo systemctl restart network"
        # vagrant2.vm.provision "attatch cdrom to /media/dvd", type: "shell", preserve_order: true, inline: "sudo mkdir -p /media/dvd; sudo sh -c 'mount /dev/sr0 /media/dvd; true'"

        vagrant2.vm.provision "ansible" do |ansible|
            preserve_order = true
            ansible.limit = "all"
            ansible.verbose = "v" # "v" or "vvvv"
            ansible.playbook = "tests/test_vagrant.yml"

            ansible.groups = {
                "cobbler" => ["vagrant[1:2]"],
                "cobbler:vars" => {"key1" => "value1"}
            }

        end

    end
end

