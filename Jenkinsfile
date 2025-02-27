pipeline {
    agent any
    environment {
        PATH = "/bin:/usr/bin:/usr/local/bin:$PATH"
    }
    stages {
        stage('Test Docker') {
            steps {
                script {
                    docker.image("my-go-app").inside {
                    sh 'docker --version'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.image("my-go-app").inside {
                    sh 'docker build -t my-go-app -f webapi/Dockerfile .'
                    }
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    docker.image("my-go-app").inside {
                        sh 'docker run my-go-app'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image("my-go-app").run("-d -p 8080:8080")
                }
            }
        }
    }
}
