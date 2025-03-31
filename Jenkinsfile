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
        echo ' Ejecutando tests...' 
        sh 'npm test'
      }
    }

    stage('Deploy en contenedor de la asignatura (host)') {
      steps {
        echo ' Desplegando build en el contenedor host...' 
        sh 'npm run build'

        // Asegúrate que esta ruta existe o cámbiala según tu contenedor
        sh 'mkdir -p /var/www/html && cp -r build/* /var/www/html/'
      }
    }

    stage('Deploy en contenedor Docker dentro del contenedor de la asignatura') {
      steps {
        echo 'Ejecutando contenedor Docker y desplegando app dentro...' 

        script {
          // Creamos imagen Docker temporal basada en Node
          sh '''
            docker run --rm -v $PWD:/app -w /app node:16 \
              sh -c "npm install && npm run build"
          '''
        }
      }
    }
  }
}

