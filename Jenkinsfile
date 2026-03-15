pipeline {
agent any

```
environment {
    ANDROID_HOME = "C:\\Users\\valer\\AppData\\Local\\Android\\Sdk"
    ANDROID_SDK_ROOT = "C:\\Users\\valer\\AppData\\Local\\Android\\Sdk"
    PATH = "${env.PATH};C:\\Users\\valer\\AppData\\Local\\Android\\Sdk\\platform-tools"
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

}
```

}
