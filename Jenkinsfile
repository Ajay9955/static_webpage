pipeline{
  agent{
    docker{
      image 'ubuntu'
      args '-u root --network host'
    }
  }
  environment{
    DOCKER_IMAGE = 'ajay302001/webpage'
  }
  stages{
    //here in this stage we can install the req libraries or dependencies and create the enviornment required for our app.
    stage('setup'){
      steps{
        script{
          sh 'apt-get update && apt-get install -y python3 python3-pip'
          sh 'apt-get install -y docker.io'
        }
      }
    }
    stage('check docker'){
      steps{
	script{
	sh "docker --version"
	sh "systemctl status docker"
	}
      }
    }
    stage('checkout'){
      steps{
        script{
          git branch:'main', url:'https://github.com/Ajay9955/static_webpage.git'
        }
      }
    }
    stage('build'){
      steps{
        script{
          docker.build("${DOCKER_IMAGE}:latest", "-f dockerfile .")
        }
      }
    }
   stage('deploy'){
     steps{
       script{
	withCredentials([usernamePassword(credentialsId: 'sakdockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')])
	{
         docker.withRegistry('https://index.docker.io/v1/', 'sakdockerhub'){
           docker.image("${DOCKER_IMAGE}:latest").push()
         }
         sh "docker stop ${DOCKER_IMAGE} || true && docker rm ${DOCKER_IMAGE} || true"
         sh "docker run -d --name ${DOCKER_IMAGE} -p 8000:8000 ${DOCKER_IMAGE}:latest"
       }
     }
   }
  }
 }
  post{
    always{
      cleanWs()
    }
  }
}
