# DevOps Project Demo 2
## Deploying Spring PetClinic Sample Application localy using Docker

### Use source code from your Gitlab repo

- Subtask I - Application
    * Add "docker" folder and put there all Dockerfiles and doker-related scripts if any, then commit and push them in your Gitlab repo.
    * Install docker on your host machine
    * Create Dockerfile for application container
    * docker build should:
        * Clone git project and checkout to branch specified in $BUILD_BRANCH
        * Use .m2 dir from host machine
        * Build java project
        * Put application jar into separate folder
        * Have a separate non-root user to own the application
        * Expose the 8080 port
        * Tag image as petclinic-app
    * on docker run it should start java app and connect to mysql database using credentials that you provide in environment variables.
 
- Subtask II - Database 
    * Create Dockerfile for DB container
        * Customize the mysql database to accept connections only from your private docker network subnet
        * Create a non root user and password (ENV $MYSQL_USER and $MYSQL_PASSWORD) in mysql
        * Create a database in mysql (ENV $MYSQL_DATABASE) and grant all privileges for the $MYSQL_USER to access the database
        * Expose default mysql port
        * Mysql should save data on host machine, so that it remains persistent after image rebuild
        * Tag image as petclinic-db
 
### It's up to you what base images to use. 
### Try to keep images as small as possible [make use of Dive](https://github.com/wagoodman/dive)
 
- Subtask III - Docker registry
    * Create your own docker registry on Gitlab or [DockerHub](https://hub.docker.com/)
    * Push images there

- Subtask IV - Jenkins
    * Setup Jenkins
	* Deploy Jenkins on Local VM or Docker
	* Setup Jenkins plugins (credentials, git, maven-plugin, github, Gitlab, docker, etc.)
        * Create a 1st Jenkins Job it should build your project, package jar into docker image and deploy that image to a Docker registry.
        * Create a 2nd Jenkins Job it should build Database image and deploy that image to a Docker registry.
