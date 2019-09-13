scalaVersion := "2.13.0"

name := "test"
organization := "com.github.lokkju.github-action-sbt"

import aether.AetherKeys._

logLevel in aetherDeploy := Level.Debug

// GitHub package repo isn't supporint javadoc and sources
publishArtifact in (Compile, packageDoc) := false
publishArtifact in (Compile, packageSrc) := false
