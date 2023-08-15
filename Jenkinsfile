pipeline {
    agent any
    stages {
        stage('Create Docker image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhu-id', passwordVariable: 'PASSWORD', usernameVariable: 'USER')]) {
                        sh 'docker login -u="$USER" -p="$PASSWORD"'
                    }
                }
                echo 'Creating Docker image...'
                sh 'docker build --tag vladlukjanenko/test-app:v${BUILD_NUMBER} ./'
                sh 'docker push vladlukjanenko/test-app:v${BUILD_NUMBER}'
            }
        }

        stage('Deploy AKS') {
            steps {
                echo 'Deploying Docker image to AKS...'
                sh 'pwd'
                sh 'ls -la ./'
                sh 'cp -r ./build/resources/main/helm/ ./'
                sh 'az login --service-principal -u "70e080d1-2c93-498f-b6e4-92ced8333b43" -p "Gqq8Q~scWxyRS9tVUecEgKelLpcQYwBvTIUMLdzQ" --tenant "75a8ecc8-48ec-446f-a3f4-6afab755d344"'
                sh 'az aks get-credentials --resource-group "AksRG" --name "VladCluster"'
                sh 'helm install test-app ./helm --set container.image=vladlukjanenko/test-app:v${BUILD_NUMBER}'
            }
        }
    }
}
