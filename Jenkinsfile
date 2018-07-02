pipeline {
  agent any
  stages {
    stage('Checkout') {
      parallel {
        stage('Checkout') {
          steps {
            git(url: 'https://github.com/swarden/dotfiles', branch: 'master', changelog: true, poll: true)
          }
        }
        stage('Build DWM') {
          steps {
            sh '''cd dwm
updpkgsums && makepkg'''
          }
        }
        stage('Build ST') {
          steps {
            sh '''cd cd
updpkgsums && makepkg'''
          }
        }
      }
    }
    stage('Show folders') {
      steps {
        sh 'ls -lisah'
      }
    }
    stage('Approove') {
      steps {
        input(message: 'Done?', id: 'swarden', ok: 'OKAY', submitter: 'swarden')
      }
    }
  }
}