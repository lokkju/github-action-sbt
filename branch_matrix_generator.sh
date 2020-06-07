#!/bin/bash -e

JAVA_VERSIONS=("8" "11" "14")
SBT_VERSIONS=("0.13.17" "1.1.6" "1.2.8" "1.3.10")
SCALA_VERSIONS=("2.13.2" "2.12.11" "2.11.12" "2.10.7")

# echo deleting exiting branches
# git branch -r |  grep "^  origin/" | sed "s|^  origin/|:|" | grep -v "^:HEAD" | grep -v "^:master$" | xargs git push origin
# echo deleting existing remote tags
# git push origin :refs/tags/<tagname>

for JAVA_VERSION in ${JAVA_VERSIONS[@]}
do
  for SBT_VERSION in ${SBT_VERSIONS[@]}
  do
    for SCALA_VERSION in ${SCALA_VERSIONS[@]}
    do
      git checkout -B versions/${JAVA_VERSION}-${SBT_VERSION}-${SCALA_VERSION}
      sed -i "s/\${BASE_IMAGE_TAG:.*}/\${BASE_IMAGE_TAG:-$JAVA_VERSION}/g" Dockerfile
      sed -i "s/\${SBT_VERSION:.*}/\${SBT_VERSION:-$SBT_VERSION}/g" Dockerfile
      sed -i "s/\${SCALA_VERSION:.*}/\${SCALA_VERSION:-$SCALA_VERSION}/g" Dockerfile
      git commit -a -m "Updating branch to for new version"
      git tag -f ${JAVA_VERSION}-${SBT_VERSION}-${SCALA_VERSION}
      git checkout master
    done
  done
done
#git push --all
