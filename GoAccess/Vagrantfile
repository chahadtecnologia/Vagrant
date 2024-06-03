Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    config.vm.provision "shell", inline: "swapoff -a"
    config.vm.define "ubuntu", primary: true do |ubuntuserver|
      ubuntuserver.vm.hostname = "ubuntuserver"
      ubuntuserver.vm.box = "ubuntu/xenial64"
      ubuntuserver.vm.network "public_network", :bridge => 'eno1', ip: "192.168.1.11", use_dhcp_assigned_default_route: true
      ubuntuserver.vm.provision "shell",
      run: "always",
      inline: "apt-get update -y && apt-get install net-tools && route add default gw 192.168.1.1 && route del default gw 10.0.2.2"
      ubuntuserver.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"
      ubuntuserver.vm.provision "file", source: "./docker-compose.yaml", destination: "/home/vagrant/docker-compose.yaml"
      ubuntuserver.vm.provision "file", source: "./goaccess_install.sh", destination: "/home/vagrant/goaccess_install.sh"
      ubuntuserver.vm.provision "shell",
      inline: "apt-get update -y && apt-get install -y vim net-tools curl && \
              apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common gnupg2 python3 && \
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add - && \
              apt-key fingerprint 0EBFCD88 && \
              add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable' && \
              apt-get update -y &&  apt-get install -y docker-ce docker-ce-cli containerd.io && \
              curl -L \"https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose && \
              chmod +x /usr/local/bin/docker-compose && \
              ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && \
              mkdir -p /home/vagrant/apache2/reports && touch /home/vagrant/apache2/reports/reports.html && \
              mkdir -p /home/vagrant/apache2/logs && touch /home/vagrant/apache2/logs/access.log && touch /home/vagrant/apache2/logs/error.log && \
              cd /home/vagrant && docker-compose up -d && \
              chmod +x /home/vagrant/goaccess_install.sh && bash -x /home/vagrant/goaccess_install.sh && \
              cd /home/vagrant/.ssh && cat id_rsa.pub >> authorized_keys && chmod 0400 id_rsa.pub"         
    end
  end
  
