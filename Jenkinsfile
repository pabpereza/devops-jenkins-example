pipeline {

  
    agent any

    stages {
        
        stage('Build') {
         
            steps{
                echo 'Cloning repository'
                git branch: 'master', url: 'https://github.com/pabpereza/devops-jenkins-example'
            
                echo 'Installing dependencies'
                sh 'pip3 install -r requirements.txt'
            }
        } 
        
        
        stage('Test') {
            steps {
                echo 'Testing..'
		
            }
        }

            
        stage('Deploy') {
            steps {
                sshagent (credentials: ['ssh-aws-deploy']) {
                    sh 'ssh -o StrictHostKeyChecking=no -T <user>@<host> <comando>
            }
                                
        }
    }
}
