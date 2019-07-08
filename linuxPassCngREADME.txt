This is an ansible playbook to change passwords for linux hosts in your network. 

There are three files included for this playbook.

=================================================
1) "testLinuxHosts"
=================================================
The file containing information about the host machines in the network which the user would like to change the passwords. 

The current file contains an example format of how to record your host information:

The first line should be:
[docker]

The following lines stating:
user-name ansible_host=192.168.10.1 ansible_user=name

********* ansible_host=***.***.**.* ansible_user=****
('*' being variables specific to the host)

You can use as many hosts as you like. 

Its best practice to have a different password for every host.  You can keep the hosts commented out ('#' at the beggining of the line), then uncomment the host which needs the password change.  This may be an easier approach than logging into every machine manually. 

That being said, developers working on a multi-host project may choose to use the same password on an internal network (at least on select machines), but change the password often.  This playbook would be very useful in that situation. 

=================================================
2) testPassHas.sh
=================================================
This is a simple script called from the .yaml file that requires the user to enter the password twice to prevent lockouts from a typo.

=================================================
3)linuxChangeHostPasswordsGeneric.yaml
=================================================
This file calls the "testLinuxHosts" file to SSH into the host machines on your network. 
Once inside the host(s), the testPassHash.sh script is called for password verification. 
The password is changed with the hash created using SHA512, then stored on the host machine(s).
An email is then sent to the user(s) specified in the .yaml file.

**Note**  There is an open TODO ticket for a password manager connection feature.  It's not recommended to use the option to send the password to the local machine in a .txt file option;hence why it's commented out. 

Hope this is useful to you

