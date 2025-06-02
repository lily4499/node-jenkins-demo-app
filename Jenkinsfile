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
        git branch: 'feature/login', url: 'https://github.com/lily4499/node-jenkins-demo-app.git'
      }
    } 

    stage('Install') {
      steps {
        sh 'npm install'
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Run Sonarqube') {
      environment {
        scannerHome = tool 'sonar-scan'
      }
      steps {
        withSonarQubeEnv('MySonar') {
          sh "${scannerHome}/bin/sonar-scanner"
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
        withCredentials([usernamePassword(credentialsId: 'lily-docker-credentials', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh 'docker push $IMAGE:${params.TAG}'
        }
      }
    }

    stage('Approval') {
      steps {
        input message: 'Approve deployment to production?'
      }
    }

    // Uncomment to deploy after approval
    // stage('Deploy to K8s') {
    //   steps {
    //     sh 'kubectl apply -f k8s/'
    //   }
    // }
  }

  post {
    always {
      cleanWs()
      slackSend(channel: '#jenkins-notify', message: "Pipeline Result: ${currentBuild.result}")
    }
  }
}
