pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'deepanlm10'
        DEV_IMAGE = "${DOCKERHUB_USER}/dev:latest"
        PROD_IMAGE = "${DOCKERHUB_USER}/prod:latest"
        SERVER_IP = 'YOUR_EC2_PUBLIC_IP'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Build and Push Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh './build.sh $DEV_IMAGE'
                        sh 'docker push $DEV_IMAGE'
                    } else if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main') {
                        sh './build.sh $PROD_IMAGE'
                        sh 'docker push $PROD_IMAGE'
                    }
                }
            }
        }
    }
}

