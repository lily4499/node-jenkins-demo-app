pipeline {
  agent any

  parameters {
    string(name: 'TAG', defaultValue: '1.0.0', description: 'Image Tag')
  }

  environment {
    IMAGE = "laly9999/node-jenkins-demo-app"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/lily4499/node-jenkins-demo-app.git'
      }
    } 
    stage('Install & Build') {
      steps {
        sh '''
          npm install
          npm run build
        '''
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Run Sonarqube') {
      environment {
          scannerHome = tool 'sonar-scan';
      }
      steps {
          withSonarQubeEnv('MySonar') {
              sh """
                  ${scannerHome}/bin/sonar-scanner \
                 // -Dsonar.projectKey=key-test
              """
            }
        }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE:${params.TAG} .'
      }
    }

    stage('Push Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh 'docker push $IMAGE:${params.TAG}'
        }
      }
    }

    // stage('Deploy to K8s') {
    //   steps {
    //     sh 'kubectl apply -f k8s/'
    //   }
    // }
  }

  post {
    always {
      cleanWs()
    }
  }
}
