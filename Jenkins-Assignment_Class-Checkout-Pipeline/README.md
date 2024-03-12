


# Jenkins Assignment:
Checkout using class method in Pipeline and also in jenkinsfile.

To complete the assignment follow the below steps:



## Prerequisites:

1.Jenkins server installed and running.

2.A GitHub repository with the desired branch (e.g., master).

3.GitHub credentials (username and personal access token) stored in Jenkins.



## Step 1: Create a New Pipeline Job
  
1.Login to Jenkins.

2.On the Jenkins dashboard, click "New Item" to create a new job.

3.Enter a name for your pipeline job and select "Pipeline".

4.Click "OK" to proceed.



## Step 2: Configure Pipeline Settings

1.In the pipeline configuration, go to the "Pipeline" section.
    
2.Choose "Pipeline script" from the Definition dropdown.
    
3.Scroll down at the bottom of the page, click on "Pipeline Syntax".
    
4.In "Steps" section, select "checkout: Check out from version control" option.
    
5.Under "Repositories" section, in "Repository" field provide your git repository URL.
    
6.Under "Credentials", click on "Add", click on "jenkins".
    
7.On "Kind", select "Username with password".
    
8.Now provide your github credentials and provide some short keywords in "ID" field and "Description" field.
    
9.In "Credentails" field, select the required option which we created recently.
    
10.Now scroll down and go to "Repository Browser" field and select an option "githubweb".
    
11.Now provide your github repository URL in "URL" field.
    
12.Scroll down at the bottom and in "Additional Behaviors" section, click on "Add".
    
13.Select "Advanced clone behaviours" option, select "Fetch Tags" option, and then select "Honor refspec on initial clone".
    
14.Then again in "Additional Behaviors" section, click on "Add".
    
15.Select " Git LFS pull after checkout" options and then select "Check out to specific local branch" option and then below in "Branch Name" field, provide your branch name e.g "master".
    
16.Go to bottom and click on "Generate Pipeline Script". The following script will be generated:
    
	checkout scmGit(branches: [[name: '*/master']], browser: github('https://github.com/faseeh-22/25'), extensions: [cloneOption(honorRefspec: true, noTags: true, reference: '', shallow: false), localBranch('master'),  [$class: 'RelativeTargetDirectory', relativeTargetDir: 'git-checkout-pipeline']], userRemoteConfigs: [[credentialsId: 'git-checkout-pipeline', url: 'https://github.com/faseeh-22/25']])
    
17.Copy this script in paste in the pipeline.  
    
18.In the "Script" area, type the following pipeline script:


```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Git Checkout Branch') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], browser: github('https://github.com/faseeh-22/25'), extensions: [cloneOption(honorRefspec: true, noTags: true, reference: '', shallow: false), localBranch('master'),  [$class: 'RelativeTargetDirectory', relativeTargetDir: 'git-checkout-pipeline']], userRemoteConfigs: [[credentialsId: 'git-checkout-pipeline', url: 'https://github.com/faseeh-22/25']])
            }
        }
    }
}
```


**NOTE:** You have to add this line by yourself "[$class: 'RelativeTargetDirectory', relativeTargetDir: 'git-checkout-pipeline']] "



## Explanation of Pipeline Configuration:

	
**1.checkout:** This step checks out code from a source code management system.
	
**2.scmGit:** This is a method for checking out Git repositories.
	
**3.branches:** Specifies the branches to checkout. In this case, it specifies the master branch.
	
**4.browser:** Specifies the browser URL for the repository.
	
**5.extensions:** Additional options for the checkout process.
	
**6.cloneOption:** Configures the cloning behavior.
	
**7.honorRefspec:** Honors refspecs during cloning.
	
**8.noTags:** Excludes tags during cloning.
	
**9.reference:** Specifies a reference repository.
	
**10.shallow:** Performs a shallow clone.
	
**11.localBranch:** Specifies the local branch name.
	
**12.RelativeTargetDirectory:** Specifies the target directory for the checkout.

**13.userRemoteConfigs:** Configures the remote repository.

**14.credentialsId:** Refers to the credentials added earlier.
	
**15.url:** URL of the GitHub repository.



## Step 3: Save and Run the Pipeline

1.Click "Apply" to save your pipeline configuration.

2.In the pipeline's main page, click "Build Now" to run the pipeline.

3.You'll see the pipeline progress through the stages, and the code from the specified branch will be checked out.
    
    



