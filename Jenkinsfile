pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                sh 'rm -rf flask-server-with-github-actions || true'
                sh 'git clone https://github.com/AbdullrahmanEissa/flask-server-with-github-actions.git'
                echo "✅ Repo cloned"
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('flask-server-with-github-actions') {
                    sh 'docker build -t flask-app .'
                    echo "✅ Image built"
                }
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker rm -f flask-container || true'

                sh '''
                    docker run -d --name flask-container \
                    -p 5000:5000 flask-app
                '''

                echo "✅ Container running"
            }
        }

        stage('Test App') {
            steps {
                sh 'sleep 3'
                sh 'curl -f http://localhost:5000'
                echo "✅ App works"
            }
        }

        stage('Cleanup Container') {
            steps {
                sh 'docker rm -f flask-container || true'
                echo "✅ Container removed"
            }
        }

        stage('Push To DockerHub') {
            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'DOCKERHUB_USERNAME',
                    passwordVariable: 'DOCKERHUB_PASSWORD'
                )]) {

                    sh '''
                        echo "$DOCKERHUB_PASSWORD" | docker login \
                        -u "$DOCKERHUB_USERNAME" --password-stdin

                        docker tag flask-app $DOCKERHUB_USERNAME/flask-app:latest
                        docker push $DOCKERHUB_USERNAME/flask-app:latest
                    '''

                    echo "🚀 Pushed successfully to DockerHub"
                }
            }
        }
    }
}
