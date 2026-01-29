pipeline {
    agent any

    stages {
        stage('getcode') {
            steps {
                sh 'git clone https://github.com/AbdullrahmanEissa/flask-server-with-github-actions.git'
                echo 'Grapped Code Succeffully'
            }
        }
        stage('Build') {
            steps {
                sh 'docker rm -f flask-container || true'
                dir("flask-server-with-github-actions") {
                    sh 'docker build -t flask .'
                }
                  
                echo 'Build Succefful'
            }
        }
        stage('Run') {
            steps {
                dir("flask-server-with-github-actions") {
                    sh 'docker run -d -p 5000:5000 flask'
                }
                echo 'Build Succefful'
            }
        }
    }
}
