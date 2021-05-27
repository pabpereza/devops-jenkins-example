pipeline {

  
    agent any

    stages {
        
        stage('Build') {
         
            steps{
                echo 'Cloning repository'
                git branch: 'master', url: 'https://github.com/pabpereza/test1'
            
                echo 'Installing dependencies'
                sh 'pip3 install -r requirements.txt'
            }
        } 
        
        
        stage('Test') {
            steps {
                echo 'Testing..'
		
            }
        }
        
        stage('Packet'){
            steps {
                echo 'Dockerizing'
		        sh 'docker build . -t cyberstriker/lab-actions'
            }
        }
        
        stage('Test image'){
            steps{
                echo 'Analizing with trivy..'
                sh 'trivy i --severity HIGH,CRITICAL --ignore-unfixed cyberstriker/lab-actions'
            }
        }
	    
    	stage('Push image'){
            steps {
                echo 'Push image'
    	        
            }
        }
            
        stage('Deploy') {
            steps {
                sshagent (credentials: ['ssh-aws-deploy']) {
                    sh 'ssh -o StrictHostKeyChecking=no -T ubuntu@ec2-35-158-180-209.eu-central-1.compute.amazonaws.com docker rm -f nginx && docker run -d -p 80:80 --name nginx cyberstriker/actions-lab'
                }
            }
                                
        }
    }
}
