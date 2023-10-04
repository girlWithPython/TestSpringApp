pipeline {
    agent any
    stages {
        stage('Create Docker image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'pravdorubka1979', passwordVariable: 'dockerpassword', usernameVariable: 'pravdorubka1979')]) {
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
                sh 'az login --service-principal -u "415c03d3-724b-41dc-b8f5-baad1d3d44ce" -p "Xrs8Q~JoUzMikT5rRkeCDdsK.jRzX-1JJzEXpbBM" --tenant "0d46e439-2b93-4889-bfff-17f7009e1376"'
                sh 'az aks get-credentials --resource-group "TerraformExample01RG" --name "init-aks-cluster"'
                sh 'helm install test-app ./helm --set container.image=vladlukjanenko/test-app:v${BUILD_NUMBER}'
            }
        }
    }
}
