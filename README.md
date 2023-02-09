## Build

Build stage image. Replace {password}, {name} and {token} arguments
```
docker build --no-cache --platform linux/amd64 --build-arg deploy_user_password={password} --build-arg runner_name=stage --build-arg runner_token={token} -t ubuntu-stage-server:1.0.0 .
```

Build alpha image
```
docker build --no-cache --platform linux/amd64 --build-arg deploy_user_password={password} --build-arg runner_name=prod --build-arg runner_token={token} -t ubuntu-alpha-server:1.0.0 .
```

Build prod image
```
docker build --no-cache --platform linux/amd64 --build-arg deploy_user_password={password} --build-arg runner_name=prod --build-arg runner_token={token} -t ubuntu-prod-server:1.0.0 .
```

## Run
Install [Docker Compose](https://docs.docker.com/compose/install/)

And then run command
```
docker-compose up
```