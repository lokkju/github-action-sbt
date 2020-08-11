scalaVersion := "2.13.0"

name := "test"
organization := "com.github.lokkju.github-action-sbt"

publishMavenStyle := true

// GitHub package repo isn't supporting javadoc and sources
publishArtifact in (Compile, packageDoc) := false
publishArtifact in (Compile, packageSrc) := false

libraryDependencies += "org.scalatest" %% "scalatest" % "3.1.0" % Test
