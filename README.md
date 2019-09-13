
# SBT github action

This action runs sbt build commands

## Inputs

### `commands`

**Required** a set of space seperated sbt commands. Default `"test"`.

## Outputs

**none**

## Action Tags

The tag controls the version of Java, SBT, and Scala that the image is initialized with.  SBT and Scala will auto-download other versions as specified in your project settings, but if they don't match the initialized versions, it can take significant extra build time.

Currently supported tags are:
- master: 8u222-jdk-stretch, 1.3.0, 2.13.0
- 8u222-jdk-stretch_0.13.17_2.11.12: 8u222-jdk-stretch, 0.13.17, 2.11.12

__Feel free to request additional tags.__

## Example usage

uses: lokkju/github-action-sbt@master
with:
  commands: '"test" "package"'
