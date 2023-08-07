pipeline {
    agent any
    stages {
        stage('Build project with Gradle') {
            steps {
                echo 'Building project...'
                sh './gradlew clean build'
                sh 'ls -la ./'
            }
        }

        stage('Create Docker image') {
            steps {
                echo 'Creating Docker image...'
                sh 'docker build --tag vladlukjanenko/test-app:test-app ./'
                sh 'docker push vladlukjanenko/test-app:test-app-v1'
            }
        }

        stage('Deploy AKS') {
            steps {
                echo 'Deploying Docker image to AKS...'
                sh ''
            }
        }
    }
}
