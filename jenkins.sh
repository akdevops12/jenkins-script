#!/bin/bash
echo "This is a script to r un a jenkins server automaticaly"
echo
echo " Updating a packages on the launching instance."
sudo apt-get update &>/dev/null
sleep 3
echo
echo " Installing Java :"
echo  "Java will be required to run the Jenkins "
sudo apt-get install -y openjdk-11-jdk &>/dev/null
sleep 3
echo
echo " Ubuntu will use jenkins debian package."
echo  "To use this repository,we needs to add "
echo "the key in the system "
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sleep 3
echo
echo "let's add the debian binary entry in source.list"
sudo su -c "echo 'deb https://pkg.jenkins.io/debian-stable binary/' > /etc/apt/sources.list.d/jenkins.list" &>/dev/null
sleep 3
echo
echo " Updating a packages on the launching instance again."
sudo apt-get update &>/dev/null
sleep 3
echo
echo "  installing jenkins on the running instance"
sudo apt-get install -y jenkins &>/dev/null
sleep 3
echo
echo
echo "Verify the installation by checking the status of jenkins service"
service jenkins status | head -3
sleep 3
echo
echo " Display the Administrator password "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sleep 3
echo
echo " Display the ip address of my AWS EC2 instance"
curl ifconfig.co
sleep 3
echo "End of script"
