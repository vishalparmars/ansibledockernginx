# Ansible Vagrant Docker NIGNX Example Provisioning

This Repo contains an example of Vagrant Running on a VM using Ansible Provisioning. The ansible  playbook also Provisions Dockers Container and installs it on VM.
Ansible Playbook also pulls NGINX Image and deploys it on Docker container with a HTML serving Content as "Helo World VP"
This Repo installs the Vagrant Repo [Ubuntu/Trusty64] (https://app.vagrantup.com/ubuntu/boxes/trusty64). You can choose any other Vagrant Flavour.

# Before you start

#PreRequisites are as below for the example to Run.
You would need to install the below .

1) [Vagrant](http://vagrantup.com/)
2) [VirtualBox](https://www.virtualbox.org/)
3) [Ansible](http://www.ansible.com/)


# INSTALL 
  
  # 1)  You can directly download Virtual Box or use the below homebrew command for it :
   $ brew cask install virtualbox

  # 2) For Vagrant you can use the below Command for install :

   $ brew cask install vagrant

   # 3) Third and last Host Installation is the Ansible which can be insalled as below 

  Depending on your Os you can install Ansible from here [Ansible URL](https://docs.ansible.com/ansible/latest      /installation_guide/intro_installation.html)
  
  # For Linux below are Steps :
    You would need to install XCode before the below steps.
    $ brew install ansible
 
 # USAGE 
 
 Once you have the above installed and setup please clone the Repo and run the below command.
 
   # $ vagrant up                    # download, start guest, provision
    The Vagrant File Provisions the ubuntu VM on Virtual Box and provisions the Ansible Projects Playbook .
    This Application is a simple NGINX Reverse Proxy Container running on 80 and Vagrant does port forwarding on 9080.
    To Test this run the below URL in Browser or via CURL : curl -i http://127.0.0.1:9080
    Browser : http://127.0.0.1:9080 OR the Vagrant private IP setup as http://192.168.50.6:80
    
    You can also amend you  host file to map this IP to a URL name as in vi /etc/hosts :
    192.168.50.6  docker.ansible.nginx
    
    
    
    
    

  

