

# Jenkins Assignment:
Create Jenkins Pipeline:
(1) Build 3 stages:  Build , Test , Deloy  (2) Send Email notification of Failure or Success.

To complete the assignment follow the below steps:
 

**Step1.** Login to your Jenkins account


**Step2.** Click on  “Manage Jenkins”, under “System Configuration” click on “System”.


**Step3.** Scroll down and navigate to “Extended Email Notification” section.
1. In “SMTP server” section write “smtp.gmail.com”.
2. In “SMTP port” section write “465”
3. Below “SMTP port” section, click on “Advanced” option
i. Click on “Use SSL”
4. Under ”Default user e mail suffix”, click on “Advanced” option
i. In “Charset”, section select “UTF-8”
5. In “Default Content Type”, select “Plain Text(text/plain)”
6. Scroll down and navigate to “Default Triggers” options and select “Failure Any”
   

**Step4.** Scroll down and navigate to “Email Notification” section:

1. In “SMTP server” section, type “smtp.gmail.com”
2. Under ”Default user e mail suffix” section, click on “Advanced” option
i. Select “Use SMTP Authentication”, in “User Name”  write your username or gmail and in “Password”  write your password.
ii. Select “Use SSL”.
iii. In “SMTP Port” section , write “465”
iv. In  “Reply To Address” section, write your gmail address.
v. In  “Charset” field, write or select “UTF-8”
 

**Step5.** Click on “New item”


**Step6.** Type the item name e.g “Email notify”. Then Click on “Pipeline”, then click on “ok”.


**Step7.** Then under pipeline section, write the following pipeline script:
```
pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Perform build steps here
                echo 'Building...'
                // Add build commands or scripts as needed
            }
        }
        
        stage('Test') {
            steps {
                // Perform test steps here
                echo 'Testing...'
                // Add test commands or scripts as needed
            }
        }
        
        stage('Deploy') {
            steps {
                // Perform deployment steps here
                echo 'Deploying...'
                // Add deployment commands or scripts as needed
            }
        }
    }
    
    post {
        success {
            emailext subject: 'Pipeline Success',
                body: 'The pipeline has succeeded. All stages completed successfully.',
                to: 'moonstar322023@gmail.com'
        }
        
        failure {
            emailext subject: 'Pipeline Failure',
                body: 'The pipeline has failed. Please investigate and take necessary actions.',
                to: 'moonstar322023@gmail.com'
        }
    }
}
    	
``` 
 
**NOTE:** The following lines
```
emailext subject: 'Pipeline Success',
    body: 'The pipeline has succeeded. All stages completed successfully.',
    to: 'moonstar322023@gmail.com'
```
can be generated through pipeline syntax or snippet generator. To create these lines follow the below steps:
 
1. Click on “pipline syntax“.
2. Under “Sample Step”section, select  “emailext: Extended Email” plugin.
3. Under “To” section, write your gmail address.
4. Under “Subject” and “Body” sections, provide the required content.
5. At the end, just click on “Generate Pipeline Syntax” (it will create the required lines for you).
 

**Step8.** Now click on “save”


**Step9.** Click on “Build Now” (the pipeline stages will start building)


**Step10.** Now login in to your google account and check your gmail (you will see an email which was sent from Jenkins to your gmail)

**NOTE:** If there is any error or you didn`t receive an email, then make an another gmail account and follow the steps in the given link :
https://varunmanik1.medium.com/devops-jenkins-aws-series-part-3-jenkins-notifications-and-gmail-integration-a-step-by-step-bb2cac5dbd4c
 


