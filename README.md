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
