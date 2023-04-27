pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RnukaPrasad/tf-jenkins-k8.git']]])            

          }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }
        
        stage ("terraform apply") {
            steps {
                sh ('terraform apply --auto-approve') 
           }
        }
       stage('Deploying Application to AKS') {
            steps {
                withKubeConfig([credentialsId: 'k8s', serverUrl: 'https://akdnsprefix-9uggxac1.hcp.swedencentral.azmk8s.io']){
                sh 'kubectl apply -f deployment.yaml'
                }
      }
    } 
    }
}
