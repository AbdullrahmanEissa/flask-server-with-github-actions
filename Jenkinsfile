pipeline {
  agent any

  stages {

    stage("Clone") {
      steps {
        sh 'rm -rf flask-server-with-github-actions || true'
        sh 'git clone https://github.com/AbdullrahmanEissa/flask-server-with-github-actions.git'
      }
    }

    stage("Build") {
      steps {
        dir("flask-server-with-github-actions") {
          sh 'docker build -t flask-app .'
        }
      }
    }

    stage("Push To DockerHub") {
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'docker',
          usernameVariable: 'DOCKER_USER',
          passwordVariable: 'DOCKER_PASS'
        )]) {

          sh '''
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            docker tag flask-app $DOCKER_USER/flask-app:latest
            docker push $DOCKER_USER/flask-app:latest
          '''
        }
      }
    }
  }

  post {
    always {
      sh 'docker rm -f flask-container || true'
    }
  }
}
