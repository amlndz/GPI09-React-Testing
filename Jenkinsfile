pipeline {
  agent any

  triggers {
    pollSCM('H/15 * * * *')
  }

  stages {
    stage('Build') {
      steps {
        echo 'Instalando dependencias...' 
        sh 'npm install --legacy-peer-deps'
      }
    }

    stage('Testing') {
      steps {
        echo ' Ejecutando tests...' 
        sh 'npm test'
      }
    }

    stage('Deploy en contenedor host') {
      steps {
        echo 'desplegando en /var/www/html...' 
        sh 'npm run build'
        sh 'mkdir -p /var/www/html && cp -r build/* /var/www/html/'
      }
    }

    stage('Deploy en contenedor Docker') {
      steps {
        echo ' Ejecutando despliegue en contenedor Docker...' 
        script {
          sh '''
            docker run -d -p 3000:3000 \
              -v $PWD:/app -w /app node:14 \
              sh -c "npm install --legacy-peer-deps && npm run build && npm install -g serve && serve -s build -l 3000"
          '''
        }
      }
    }

    stage('Verificación GitOps') { 
      steps {
        echo ' Pipeline lanzado automáticamente gracias a GitOps.' 
      }
    }
  }
}
