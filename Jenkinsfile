pipeline {
    agent any

    environment {
        GITHUB_TOKEN = credentials('github-token')
    }

    stages {

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

        stage('Upload APK to GitHub') {
            steps {
                bat """
                curl -L ^
                -H "Authorization: token %GITHUB_TOKEN%" ^
                -H "Accept: application/vnd.github+json" ^
                https://uploads.github.com/repos/val0987/flutter-instagram-clone/releases/1/assets?name=app-release.apk ^
                --data-binary "@build/app/outputs/flutter-apk/app-release.apk"
                """
            }
        }
    }
}


