pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo ' Instalando dependencias...' 
        sh 'npm install'
      }
    }

    stage('Testing') {
      steps {
        echo 'Ejecutando tests...' 
        sh 'npm test'
      }
    }

    stage('Deploy en contenedor host') {
      steps {
        echo ' Desplegando en el contenedor principal...' 
        sh 'npm run build'
        // Cambia esta ruta si es necesario
        sh 'mkdir -p /var/www/html && cp -r build/* /var/www/html/'
      }
    }

    stage('Deploy en contenedor Docker') {
      steps {
        script {
          docker.image('node:16').inside {
            sh 'npm install'
            sh 'npm run build'
          }
        }
      }
    }
  }
}
