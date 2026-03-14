pipeline {
    agent any

    stages {

        stage('Install dependencies') {
            steps {
                bat 'C:\\src\\flutter\\bin\\flutter.bat pub get'
            }
        }

        stage('Run tests') {
            steps {
                bat 'C:\\src\\flutter\\bin\\flutter.bat test'
            }
        }

    }
}