pipeline {

    environment {
        registry = "cyberstriker/lab-actions"
        registryCredential = 'dockerhub'
    }
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
		dscript {
			dockerImage = docker.build registry + ":latest"
		}
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
                echo 'Dockerizing'
		script {
		  docker.withRegistry( '', registryCredential ) {
		    dockerImage.push()
		  }
		}
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
