# CyberSecurityBootcamp
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/CJBOULDER/CyberSecurityBootcamp/blob/main/Diagrams/Network_Design.png "Network Diagram")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above or make changes to the architecture as needed. Select portions of each yaml file may be used to install only certain pieces of it, such as Filebeat.

 [Exampl Yaml file for Filebeat](https://github.com/CJBOULDER/CyberSecurityBootcamp/blob/main/Ansible/roles/install-filebeat/tasks/main.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build
- How to test the install and log collection


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK stack allows users to easily monitor the vulnerable VMs for changes to the filesystem and system performance. The ELK stack is in a separate region and virtual network. This helps separate operational services with production services.


The configuration details of each machine may be found below.

| Name     | Function                                      | IP Address | Operating System |
|----------|-----------------------------------------------|------------|------------------|
| Jump Box | Gateway                                       | 10.0.0.6   | Linux            |
| Web01    | Host for container running DVWA               | 10.0.0.4   | Linux            |
| Web02    | Host for container running DVWA               | 10.0.0.5   | Linux            |
| Web03    | Host for container running DVWA               | 10.0.0.7   | Linux            |
| Elk      | Monitoring and log aggregation for DVWA hosts | 10.1.0.24  | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 67.190.16.93 [my home pc]

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accesible | Allowed IP addresses |
|----------|--------------------|----------------------|
| Jump Box | Yes                | 67.190.16.93         |
| Web1     | No                 | Local Vnet           |
| Web2     | No                 | Local Vnet           |
| Web3     | No                 | Local Vnet           |
| Elk      | Yes                | 67.190.16.93         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually. This is advantageous because it allows for consistent, repeatable configuration and speeds up deployments of changes. This also allows for reusing this code for updating this environment or creating new environments.

The playbook implements the following tasks:
- Downloads and installs Docker on the ELK server
- Downloads, installs and starts ELK on a docker container on hosted on the ELK server
- Downloads, installs and starts filebeat on the docker container running on each web server, forwarding logs to the ELK server
- Downloads, installs and starts metricbeat on the docker container running on each web server, forwarding metrics to the ELK server


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker Container Running](https://github.com/CJBOULDER/CyberSecurityBootcamp/blob/main/images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
| Name     | Function                                      | IP Address | Operating System |
|----------|-----------------------------------------------|------------|------------------|
| Web01    | Host for container running DVWA               | 10.0.0.4   | Linux            |
| Web02    | Host for container running DVWA               | 10.0.0.5   | Linux            |
| Web03    | Host for container running DVWA               | 10.0.0.7   | Linux            |

We have installed the following Beats on these machines:
- filebeat
- metricbeat

These Beats allow us to collect the following information from each machine:
- `filebeat` collects linux logs. This allows us to track things like user logon events, failed access attempts, service starts and stops. 
- `metricbeat` collects system metrics from the web servers. We look for things like cpu usage, memory usage, drive space usage and drive space available for each host. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ansible.cfg file to /etc/ansible [or your home directory for ansible if different].
- Update the host file to include the hosts that you would like to manage with the playbook
- Run the playbook /Ansible/main.yml and navigate to your ELK server on port tcp 5601 to ensure to check that the installation worked as expected.

### Testing the log collection
- Run the ../Linux/repeated_ssh_attemts.sh shell script to test for access attempts reaching your logs on the Elk Server
- Search for access attempts from user 'yoyo' after running the shell script to ensure that logs are reaching the ELK server for each web server.
