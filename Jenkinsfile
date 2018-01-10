pipeline {
  agent {
    label 'scanner'
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t phenomique/raspberry-sane-git .'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run --rm -v /dev/bus/usb:/dev/bus/usb --privileged raspberry-sane-git scanimage -V'
        sh 'docker run --rm -v /dev/bus/usb:/dev/bus/usb --privileged raspberry-sane-git scanimage -L'
        sh 'docker run --rm -v /dev/bus/usb:/dev/bus/usb --privileged raspberry-sane-git scanimage --mode gray --source TPU8x10 --resolution 600 --format tiff > test.tiff'
        archive 'test.tiff'
      }
    }
    stage('Push') {
      when {
        branch 'master'
      }
      steps {
        withDockerRegistry(registry: [credentialsId: 'phenomique-dockerhub']) {
          sh 'docker push phenomique/raspberry-sane-git:latest'
        }
      }
    }
  }
}
