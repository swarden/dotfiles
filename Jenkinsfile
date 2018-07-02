def repo = 'https://github.com/swarden/dotfiles'

properties([
            disableConcurrentBuilds(),
            parameters([
                    [$class: 'GitParameterDefinition',
                     branch: '',
                     branchFilter: '.*',
                     defaultValue: '', // тут обычно sprint или Sprint бранчи.
                     description: 'Chose branch for build.',
                     name: 'BRANCH_NAME', // Переменная которая прописывается в SCM
                     quickFilterEnabled: false,
                     selectedValue: 'NONE',
                     sortMode: 'NONE',
                     tagFilter: '*',
                     type: 'PT_BRANCH'] // можно указать PT_BRANCH для бранчей или PT_TAG для тэгов.
            ]),
            // Каждые две минуты проверяет репо на наличие обновлений и билдит
            pipelineTriggers([
                    pollSCM('*/2 * * * *')
            ]),
            // оставляет 20 сборок хранить
            buildDiscarder(
                    logRotator(
                            artifactDaysToKeepStr: '',
                            artifactNumToKeepStr: '',
                            daysToKeepStr: '',
                            numToKeepStr: '20'
                    )
            )
])

pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
            timestamps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '${BRANCH_NAME}']],
                          doGenerateSubmoduleConfigurations: false,
                          extensions: [],
                          submoduleCfg: [],
                          userRemoteConfigs: [[
                                                      // credentialsId: "${creds}",
                                                      url: "${repo}"
                                              ]]
                ])
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
