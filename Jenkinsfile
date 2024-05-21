pipeline{
  agent any

  environment{
    IMAGE_TAG = "${BUILD_NUMBER}"
  }
  stages{
    //here in this stage we can install the req libraries or dependencies and create the enviornment required for our app.
    stage('checkout'){
      steps{
          git branch:'main', url:'https://github.com/Ajay9955/static_webpage.git'
        }
    }
    stage('build'){
      steps{
          sh "docker build -t ajay302001/webpage:${BUILD_NUMBER} -f dockerfile ."
      }
    }
   stage('push and run'){
     steps{
       	 sh "docker push ajay302001/webpage:${BUILD_NUMBER}"
         sh "docker run -d --name ${DOCKER_IMAGE} -p 8000:8000 ajay302001/webpage:${BUILD_NUMBER}"
       }
     }
   }
  post{
    always{
      cleanWs()
    }
  }
}
