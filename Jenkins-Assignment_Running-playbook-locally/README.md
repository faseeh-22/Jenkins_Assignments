

# Assignment: 
Create a jenkins job that runs a shell script locally, in that shell script run an ansible playbook to start nginx server. To complete the assignment follow the below steps.
 


## Prerequisites:
 
**1. Jenkins Server:** Make sure you have a Jenkins server up and running. You should have administrative access to Jenkins.
 
**2. Ansible Installed:** Ansible should be installed on the machine where Jenkins is running.

 

## Steps
 
 **Step1. Create an Ansible Playbook:** 

Create a file named `nginx.yml` with the following content. This playbook will install and start the Nginx server on the localhost.
``` 
- hosts: localhost
  connection: local
  become: true
  tasks:
    - name: Install nginx
  	apt:
    	name: nginx
    	state: latest
 
    - name: Start the service
  	service:
    	name: nginx
    	state: started
 ```
**Step2. Set Up the Jenkins Job:**
 
**1. Log in to Jenkins:** Open your Jenkins dashboard and log in with administrative credentials.
 
**2. Create a New Job:**
   - Click on "New Item" to create a new Jenkins job.
   - Enter a name for the job (e.g., "Nginx Deployment").
   - Choose the "Pipeline" option and click "OK".
 
**3. Configure Pipeline:**
   - Under the "Pipeline" section, choose "Pipeline script" from SCM.
   - Select "None" for the SCM, as we will be using a pipeline script.
   - In the "Script" text area, enter the following pipeline script:
``` 
pipeline {
    agent any

    stages {
        stage('Run playbook') {
            steps {
                script {
                    sh '''
                        cd /home/faseeh
                        ansible-playbook -b -i invent.ini nginx.yml
                    '''
                }
            }
        }
    }
}
``` 
 
Replace `/path/to/playbook/directory` with the actual path to the directory where your `nginx.yml` playbook is located.
 
**Step3. Create an Inventory File:**

Create a file named `invent.ini` in the same directory as your Jenkins job's pipeline script. This inventory file specifies the target host for the Ansible playbook.
``` 
 [localhost]
127.0.0.1 ansible_connection=local
``` 
**Step4. Save and Build:**
 
**1. Save:** Save the Jenkins job configuration.

**2. Build Job:** Click on "Build Now" to trigger the Jenkins job.
 
**Step5. Verify the Deployment:**

Once the Jenkins job completes successfully, the Nginx web server should be installed and started on the localhost. You can verify this by accessing the Nginx default page using a web browser.
 
 
 


