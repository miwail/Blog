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
                    sh tar --exclude='./.git' -czv ${env.BUILD_NUMBER}.tar.gz /opt/test/${env.BUILD_NUMBER}
                    """
                }
                echo "Build stage complete succesfuly"

            }
        }
    }


}
