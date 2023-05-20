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
        // code placeholder
        stage('Push image') {
        /* Finally, we'll push the image with two tags:
        * First, the incremental build number from Jenkins
        * Second, the 'latest' tag. */
        withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {

        docker.withRegistry('', 'docker-hub-credentials') {
        sh "docker login -u ${USERNAME} -p ${PASSWORD}"
        myImage.push("${env.BUILD_NUMBER}")
        myImage.push("latest")
        }   

    }
}
