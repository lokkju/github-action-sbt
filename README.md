
# SBT github action

This action runs sbt build commands

## Inputs

### `commands`

**Required** a set of space seperated sbt commands. Default `"test"`.

### `sbt_project_directory`

a relative path to the directory containing your project build.sbt

__not needed unless your build.sbt is not in the root of your repository__

### `settings_sbt`

The contents of a file that will be writen to {sbt_project_directory}/github_action_sbt_settings.sbt

This is useful for setting repositories, credentials, etc

## Outputs

**none**

## Action Tags

The tag controls the version of Java, SBT, and Scala that the image is initialized with.  SBT and Scala will auto-download other versions as specified in your project settings, but if they don't match the initialized versions, it can take significant extra build time.

The tag format is `{JAVA_VERSION}-{SBT_VERSION}-{SCALA_VERSION}`
Currently supported tags are:
```
JAVA_VERSIONS=("8" "11" "14")
SBT_VERSIONS=("0.13.17" "1.1.6" "1.2.8" "1.3.0")
SCALA_VERSIONS=("2.13.0" "2.12.10" "2.11.12" "2.10.7")
```

__Feel free to request additional tags.__

## Example usage

This example demonstrates advanced usage, including configuring a project to deploy to the GitHub Packages repository using SBT
```
- name: SBT action test
  id: sbt
  uses: ./
  with:
    commands: test
    sbt_project_directory: ./test
```


