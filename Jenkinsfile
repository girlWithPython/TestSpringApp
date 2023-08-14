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
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhu-id', passwordVariable: 'PASSWORD', usernameVariable: 'USER')]) {
                        sh 'docker login -u="$USER" -p="$PASSWORD"'
                    }
                }
                echo 'Creating Docker image... id= =$DOCKER_HUB_ID'
                sh 'docker build --tag vladlukjanenko/test-app:test-app ./'
                sh 'docker push vladlukjanenko/test-app:test-app'
            }
        }

        stage('Deploy AKS') {
            steps {
                echo 'Deploying Docker image to AKS...'
                sh 'cp -r ./build/resources/main/helm/ ./'
                sh 'az aks get-credentials --resource-group "AksRG" --name "VladCluster"'
                sh 'helm install testApp ./helm'
            }
        }
    }
}
