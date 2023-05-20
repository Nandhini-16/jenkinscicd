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
        stage('Push image') {
                        steps {
                            
                        withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                            docker.withRegistry('', 'docker-hub-credentials') {
                                sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                                myImage.push("${env.BUILD_NUMBER}")
                                myImage.push("latest")
                            }
                            
                        }


                        }
                            
        }

                

    }
}
