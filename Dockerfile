FROM hseeberger/scala-sbt as builder

ARG KM_VERSION=1.3.3.17 

RUN curl -fsL https://github.com/yahoo/kafka-manager/archive/${KM_VERSION}.tar.gz | tar xfz - -C /tmp 

WORKDIR /tmp/kafka-manager-${KM_VERSION}

RUN sbt clean dist

RUN unzip ./target/universal/kafka-manager-${KM_VERSION}.zip -d / && \
    mkdir -p /dist && \
    mv /kafka-manager-${KM_VERSION}/* /dist

FROM openjdk:8-jre-alpine

ENV ZK_HOSTS=zookeeper:2181

WORKDIR /kafka-manager

COPY --from=builder /dist .

RUN apk add --no-cache bash

EXPOSE 9000 

CMD ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]