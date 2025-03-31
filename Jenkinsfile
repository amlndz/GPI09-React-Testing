pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo 'Instalando dependencias...' 
        sh 'npm install'
      }
    }

    stage('Testing') {
      steps {
        echo 'Ejecutando tests...' 
        sh 'npm test'
      }
    }
  }
}
