#!groovy

def var=0

pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "${env.BRANCH_NAME}"
                sh "printenv"
            }
        }
    }
}
