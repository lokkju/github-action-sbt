#!/bin/bash -e

JAVA_VERSIONS=("8" "11") # "14")
SBT_VERSIONS=("0.13.18") # "1.0.4" "1.1.6" "1.2.8" "1.3.0")
SCALA_VERSIONS=("2.13.0") # "2.12.10" "2.11.12" "2.10.7")

# echo deleting exiting branches
# git branch -r |  grep "^  origin/" | sed "s|^  origin/|:|" | grep -v "^:HEAD" | grep -v "^:master$" | xargs git push origin

for JAVA_VERSION in ${JAVA_VERSIONS[@]}
do
  for SBT_VERSION in ${SBT_VERSIONS[@]}
  do
    for SCALA_VERSION in ${SCALA_VERSIONS[@]}
    do
      git checkout -B ${JAVA_VERSION}-${SBT_VERSION}-${SCALA_VERSION}
      #sed 's/\${JAVA_VERSION:.*}/\${JAVA_VERSION:-$JAVA_VERSION}/g' Dockerfile
      #sed 's/\${SBT_VERSION:.*}/\${SBT_VERSION:-$SBT_VERSION}/g' Dockerfile
      #sed 's/\${SCALA_VERSION:.*}/\${SCALA_VERSION:-$SCALA_VERSION}/g' Dockerfile
      git commit -a -m "Updating branch to for new version"
      git checkout master
    done
  done
done
