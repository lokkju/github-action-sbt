# Pull base image
ARG BASE_IMAGE_TAG
FROM openjdk:${BASE_IMAGE_TAG:-8}

# Env variables
ARG SCALA_VERSION
ENV SCALA_VERSION ${SCALA_VERSION:-2.10.7}
ARG SBT_VERSION
ENV SBT_VERSION ${SBT_VERSION:-1.3.0}

WORKDIR /root

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb

# Prepare sbt
RUN \
  sbt sbtVersion && \
  mkdir -p project && \
  echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt && \
  echo "sbt.version=${SBT_VERSION}" > project/build.properties && \
  echo "case object Temp" > Temp.scala && \
  sbt compile && \
  rm -r project && rm build.sbt && rm Temp.scala && rm -r target

  ADD entrypoint.sh /entrypoint.sh
  ENTRYPOINT ["/entrypoint.sh"]
