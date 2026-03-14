pipeline {
    agent any

    stages {

        stage('Prepare Git safe directory') {
            steps {
                bat 'git config --global --add safe.directory C:/src/flutter'
            }
        }

        stage('Get dependencies') {
            steps {
                bat 'C:\\src\\flutter\\bin\\flutter.bat pub get'
            }
        }

        stage('Run tests') {
            steps {
                bat 'C:\\src\\flutter\\bin\\flutter.bat test'
            }
        }

        stage('Build APK') {
            steps {
                bat 'C:\\src\\flutter\\bin\\flutter.bat build apk --release'
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/*.apk', fingerprint: true
            }
        }
    }
}