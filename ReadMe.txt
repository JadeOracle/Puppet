Puppet Project Readme Directions

Step List

1: Install Virtual Box

2: Install Vagrant

3: Install Git Bash (optional but recommended)

4: Restart Computer

5: Add the supplied virtual box to C:\Users\Administrator.vagrant.d\boxes

6: Using Git Bash move to the location you wish to use as a directory

7: Add supplied vagrantfile and accompanying bootstrap.sh (both agent and master)

8: Use command 'vagrant up'

9: Wait

10: Keep waiting

11: Keep Waiting (https://www.reddit.com/r/aww/ will help)



Optional Checks Of Installations

Java
Version can be checked using command " java -version "

Maven
Version can be checked using command " mvn -version "

Git
Version can be checked using command " git --version "
Initial git folder can be found at "/home/vagrant/Documents/" (Should find a folder named Battleships)  

Jira
Site found at localhost:8080

Nexus
Site found at loaclhost:8081/Nexus
Status can also be checked using the command  " su vagrant /opt/nexus-2.9.2-01/bin/nexus status "

Jenkins
Site found at localhost:8082
Status can also be checked using the command  " service jenkins status "
