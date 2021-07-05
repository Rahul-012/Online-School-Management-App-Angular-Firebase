node {
        //get the code form SCM
        stage('SCM') {
          
                // Get some code from a GitHub repository
                git 'https://github.com/Rahul-012/Online-School-Management-App-Angular-Firebase.git'
        }
       
        //building the docker image
        stage('Build Docker Image'){     
              sh 'docker image build . -t devops-online-website'      
        }
        
        //push the image to docker hub
        stage('Docker Hub push'){
         withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'password', usernameVariable: 'username')]) {
        
            // some block
            sh 'docker login -u $username -p $password'

            //push the image
            sh 'docker image push rahrthr12/devops-online-website'

            //delete the image form local machine
            sh 'docker image rm rahrthr12/devops-online-website'   
        } 
       
        }

        // deploy it to kubernetes cluster
        stage('deploy it to kubernetes cluster') {
            try{
              sh 'kubectl create -f deployment.yml'
            }
            catch(ex){
              sh 'kubectl apply -f deployment.yml'
            }    
        }

      // deploy service kubernetes cluster
        stage('deploy it to kubernetes cluster') {
            try{
            sh 'kubectl create -f service.yml'
            }
            catch(ex){
            sh 'kubectl apply -f service.yml'
            }        
          }
    
}
