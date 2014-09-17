salt-vagrant-mobile
===================

WIP - Salt solution to provide environments and dev flow for mobile app development

###Objective

* To provide a platform agnostic and stateless solution for developing mobile applications.
* To define seamless, test & build focussed local development workflow.

###Inspiration and related projects

Chris has a [blog](http://www.afewmorelines.com/a-full-deployment-pipeline-using-vagrant-saltstack-and-jenkins/) and a [github project](https://github.com/Netsensia/vagrant-salt-jenkins) which describes a development workflow using salt to deploy and maintain salt-minions, each of which serve specific purpose.

Saltstack allows you to easily configure a basic flavor of VM to suit your requirements.

###Technologies
- Saltstack
- Vagrant
- Cordova/ Phonegap
- Jenkins

###Development Workflow

####Aim
- Developer host machine should be void of any platform specific install or configuration
- Remove requirement of committing vendor libraries to a project repository
- Provide access to local continuous intergration environment

####Flow
- Start up `salt-master` and any other `minions` with Vagrant.
- Provide state files on the `salt-master` which holds configuration data required to bring up development VM's on different flavors of `salt-minion`.
    - e.g A salt-master would be able to configure a Windows VM with all environments required for development
- Configure the vagrant shared folder which would be shared with the development VM.

###To-do:
- Vagrant config file to start a VM and configure it as a salt-master
- Provide sls files to the salt-master to be able to configure any flavor of VM with the required development environment
