
# SBT github action

This action runs sbt build commands

## Inputs

### `commands`

**Required** a set of space seperated sbt commands. Default `"test"`.

### `sbt_project_directory`

a relative path to the directory containing your project build.sbt

__not needed unless your build.sbt is not in the root of your repository__

### `settings_sbt`

The contents of a file that will be writen to {sbt_project_directory}/project/github_action_sbt_settings.sbt

This is useful for setting repositories, credentials, etc

## Outputs

**none**

## Action Tags

The tag controls the version of Java, SBT, and Scala that the image is initialized with.  SBT and Scala will auto-download other versions as specified in your project settings, but if they don't match the initialized versions, it can take significant extra build time.

Currently supported tags are:
- master: 8u222-jdk-stretch, 1.3.0, 2.13.0

__Feel free to request additional tags.__

## Example usage
```
uses: lokkju/github-action-sbt@master
with:
  commands: test package
  sbt_project_directory: ./test
  settings_sbt: |
    externalResolvers += "GitHub lokkju Apache Maven Packages" at "https://maven.pkg.github.com/lokkju"
    credentials += Credentials("GitHub lokkju Apache Maven Packages", "maven.pkg.github.com", "lokkju", "${{ secrets.GITHUB_TOKEN }}")
```
