pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/swarden/dotfiles', branch: 'master', changelog: true, poll: true)
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