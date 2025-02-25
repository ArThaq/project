pipeline {
    agent any
    environment {
        PATH = "/bin:/usr/bin:/usr/local/bin:$PATH"
    }
    stages {
        stage('Test Docker') {
            steps {
                script {
                    sh 'docker --version'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t my-go-app -f /webapi/Dockerfile .'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    sh 'docker run my-go-app'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 8080:8080 my-go-app'
                }
            }
        }
    }
}
