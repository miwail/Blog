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
                script{
                echo 'Build stage step 1'
                cd /opt/test/
                mkdir {env.BUILD_NUMBER} && cd {env.BUILD_NUMBER}
                git clone {GIT_URL}
                ls -l 
                }
            }
        }
        stage ("deploy"){
            steps {
                echo "deplying app....."
            }

        }
    }

}
