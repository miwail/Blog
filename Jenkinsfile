pipeline {
    agent {
        label "ROR"
    
    }
    environment {
        GIT_URL = "https://github.com/miwail/Blog.git"
    }
    stages {
        stage ("build"){
            steps {
                script { """
                    echo Build #: ${BUILD_NUMBER}
                    sh cd /opt/test/
                    sh mkdir ${env.BUILD_NUMBER} && cd ${env.BUILD_NUMBER}
                    sh git clone ${GIT_URL}
                    """
                }
                echo "Build stage complete succesfuly"

            }
        }
    }
    post {
        always {
            tar file: '${env.BUILD_NUMBER}.tar.gz', dir: '/opt/test/${env.BUILD_NUMBER}/'

            }

        }
    

}
