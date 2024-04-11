Build Dev Docker Image

```bash
docker image build . -t kodega2016/react-app-dev -f Dockerfile.dev
```

We can run the container with the following command:

```bash
docker container run -d --name webapp -p 80:3000 -v $(pwd):/app -v /app/node_modules kodega2016/react-app-dev
```

Here, we are mounting the current directory to the /app directory in the container.
This will allow us to make changes to the code on our local machine and see the changes reflected in the container.

Here, we are going to use github actions to build docker image and run the unit testing using docker container.


To Deploy the application to AWS Elastic Beanstalk

a) First need to create a IAM role with the following permissions:
- AWSElasticBeanstalkWebTier
- AWSElasticBeanstalkMulticontainerDocker
- AWSElasticBeanstalkWorkerTier
- AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy

b) Create a Elastic Beanstalk Application and Environment
- Create a Elastic Beanstalk Application
- Create a Elastic Beanstalk Environment
- Select the platform as Docker(Linux 2)
- Select the Application Code as Sample application
- Create and use new service role and instance profile created in step a

c) Goto S3 and get the bucket name of the Elastic Beanstalk Application