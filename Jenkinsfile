pipeline {
    agent any
    tools {
        dockerTool "docker"
    }
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/AbdulBhashith/jenkinscicd.git'
            }
        }

        stage('Build and push image') {
            steps {
                script {
                    def dockerImage = docker.build('abulbhashiths/nodejenkins')

                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                            dockerImage.push("${env.BUILD_NUMBER}")
                            dockerImage.push('latest')
                        }
                    }
                }
            }
        }
    }
}
