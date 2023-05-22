pipeline {
  agent any
  tools {
      dockerTool "docker"
  }
  stages {
    stage('git clone') {
      steps {
         git branch: 'main', url: 'https://github.com/AbdulBhashith/jenkinscicd.git'
            }
        }
    stage('docker version') {
      steps {
        sh 'docker --version'
      }
    }
    stage('Build') {
      steps {
        sh 'docker build -t abdulbhashiths/nodejenkins .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push abdulbhashiths/nodejenkins'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
