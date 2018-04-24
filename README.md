# kafka-manager
Docker image for [kafka-manager](https://github.com/yahoo/kafka-manager)

Utilizing docker's multistage build, kafka-manager's artifacts are built using a `sbt` image ([hseeberger/scala-sbt](https://hub.docker.com/r/hseeberger/scala-sbt/)), and then copied to an `alpine` based image for a smaller footprint final image.

Inspired by [sheepkiller/kafka-manager-docker](https://github.com/sheepkiller/kafka-manager-docker)

See the `dockerfile` for additional details.

## Getting the image

Pull the image from Docker Hub using docker's pull command:

```shell
docker pull hbarel/kafka-manager
```

## Environment variables

| Variable               | Description                                     | Default                                                    |
| -----------------------| ---------------------------------------------   | ---------------------------------------------------------- |
| `ZK_HOSTS`             | `zookeeper` host name                           | `zookeeper:2181`                                           |


## Running a container

```shell
docker run -d -e "ZK_HOSTS=localhost:2181" -p 9000:9000 hbarel/kafka-manager
```

And then navigate to `localhost:9000` for `kafka-manager`'s UI

## Notes

The master branch is by default unstable and should not be used. The repository is configured to auto build docker images using this convention: 
* `master` branch -> `latest` docker image tag
* repository `tags` -> docker image concrete tags, which follow `kafka-manager`'s versions