pipeline {
    agent any
    environment {
        PATH = "/bin:/usr/bin:/usr/local/bin:$PATH"
    }
    stages {
        stage('Test Docker') {
            steps {
                script {
                    echo "Testing Docker installation..."
                    sh 'docker --version'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    echo "Building Docker image..."
                    def myApp = docker.build("my-go-app", "-f Dockerfile .")
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    echo "Running tests inside the container..."
                    docker.image("my-go-app").inside {
                        sh "go test ./..."
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo "Deploying application..."
                    docker.image("my-go-app").run("-d -p 8080:8080")
                }
            }
        }
    }
}
