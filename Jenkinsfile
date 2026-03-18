pipeline {
    agent any

    environment {
        ANDROID_HOME = "C:\\Users\\valer\\AppData\\Local\\Android\\Sdk"
    }

    stages {

        stage('Fix Flutter') {
            steps {
                bat 'C:\\src\\flutter\\bin\\flutter.bat doctor'
                bat 'C:\\src\\flutter\\bin\\flutter.bat precache'
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