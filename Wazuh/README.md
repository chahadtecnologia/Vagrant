# Ubuntu 22.04 server configuration procedure for Wazuh
## Solutions used for the lab

- Vagrant (version: 2.4.1)
- Virtualbox (version: 7.0.18)

## Necessary settings before creating the virtual machine via Vagrant

Before creating the virtual machine, the following steps will be necessary:

- Adjust the ***Vagrantfile*** file with the network address of your preference (your local network address);
- Adjust the virtual server resource settings (processor and memory) if necessary;
- Create SSH keys to access the virtual server, using the ***"vagrant"*** user;

### Creating SSH keys
If you do not have an SSH key configured for your Linux system user, use the command below to generate the keys:

> ssh-keygen -t rsa -b 4096

***Note: Keep the default when configuring the SSH key, without adding a password for the key. Also remember to run the command using system user that will be used to configure the environment.***

## Creating the virtual machine

Once all the settings are configured, run the command below to start the environment configuration process:

> vagrant up

## Accessing the virtual machine

With the virtual machine properly configured, use the command below to access the operating system (if necessary):

> ssh vagrant@<VIRTUAL_MACHINE_IP_ADDRESS>

***Example:*** ssh vagrant@192.168.0.100