# GoAccess configuration procedure
## Solutions used for the GoAccess lab

- Vagrant (version: 2.2.19)
- Virtualbox (version: 6.1)
- Docker (version: 20.10.7)
- Docker Compose (version: 1.25.4)

## Configuration required before creating the virtual machine via Vagrant

Before creating the virtual machine, the following steps will be necessary:

- Adjust the ***Vagrantfile*** file with the network address of your preference (your local network address);
- Adjust the virtual server resource settings (processor and memory) if necessary;
- Create SSH keys to access the virtual server, using the ***"vagrant"*** user;

### Creating SSH Keys
If you do not have an SSH key configured for your Linux system user, use the command below to generate the keys:

> ssh-keygen -t rsa -b 4096

***Note: Keep the default when configuring the SSH key, there is no need to add a passphrase for the key. Also remember to run the command using system user that will be used to configure the environment.***

## Creating the virtual machine

After all the settings have been adjusted, run the command below to start the environment configuration process:

> vagrant up

## Accessing the virtual machine

With the virtual machine properly configured, use the command below to access the operating system (if necessary):

> ssh vagrant@<IP_OF_VIRTUAL_MACHINE>

***Example:*** ssh vagrant@192.168.0.100

## Accessing Wordpress

To access Wordpress use the ip address from virtual server, typing port ***8081*** in the browser. See the example below:

> http://<IP_ADDRESS_VIRTUAL_MACHINE>:8081

***Example:*** http://192.168.0.100:8081

## Accessing GoAccess via browser

To access the GoAccess dashboard via browser, use the address below:

> http://<<IP_ADDRESS_VIRTUAL_MACHINE>>8081/reports/reports.html

***Example:*** http://192.168.0.100:8081/reports/reports.html