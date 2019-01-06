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
    
    
  # Ansible Setup 
    The Ansible setup and directory structure is as below
    
    ~/ansibledockernginx                                                       
    ├── Vagrantfile
    └── provision
        ├── playbook.yml
        ├── ansible.cfg
        └── roles
            └── docker_nginx
                ├── defaults
                │   └── main.yml
                ├── files
                │   └── index.html
                └── tasks
                    └── main.yml
                    
    
   There is one Role Created docker_nginx which has the Task Listed from Playbook.
   The html file for Displaying the output is placed in index.html and can be edited as per Users wish.
   Below are the steps and Task in the Playbook.
   
    First few  Task are for installing the Depndencies for Docker Library which as :
    
      apt-transport-https
      ca-certificates
      software-properties-common This software provides an abstraction of the used apt repositories
      curl 
    
    Task "Install Docker apt package" instals the Docker into the Ubuntu VM
    Next Task Ensure Docker service is installed and restarted
    
    We then Pull NGINX Image from Docker hub Repo. Pull NGINX Docker Image
    
    Next step is to build a Web Page to Serve on Nginx  which is doen by Task "Setup directory HTML and Write Indexhtml content"
    
    The Task "Ansible copy file to remote server" copeis the html file from host to guest VM
    Post any change and Reload of Vagrant we nee to ensure the Docker nginx container is removed else the run will fail.
    This is done by Task "Check for containers that actually exist"
   
   
    NGINX The Nginx container is set up by default to look for an index page at /usr/share/nginx/html, so in our new Docker            container, we need to give it access to our files at that location.To do this, we use the -v flag to map a folder from our local machine (~/docker-nginx/html) to a relative path in the container (/usr/share/nginx/html).
    
    Final Task is to run the docker command for deploying the NGINX on port 80.
    
   # Testing the application
    If the Task runs successfully you will be able to test it via shsll script provided : 
    root folder has the script runTest.sh.
    This is used to hit the URL and compare the output with the exact Expected String "Hello World VP"
    If it runs successfully the output is as below
      Hello World VP 
     “Output is NOT equal“
     
    If it fails the output is “Output is NOT equal“
    
    
 # Notes for Debugging :
 
  Any change to Vagrant file or yml file in Playbook or Task please reload Vagrant using command as below
  
  vagrant reload --provision
  
  
  Always validate yml file for ansible before running the Vagrant after any changes being done to ansible scripts via below  ansible command
  
   ansible-playbook playbook.yml --check
  
  

  
    
    
    
    
    

  

