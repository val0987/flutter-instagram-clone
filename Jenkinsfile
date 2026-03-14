pipeline {
    agent any

    stages {

        stage('Prepare Git safe directory') {
            steps {
                bat 'git config --global --add safe.directory C:/src/flutter'
            }
        }

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