# Release Tag and Repository
if [ "$TRAVIS_BRANCH" = "master" ]; then
    if ! [ "$TRAVIS_EVENT_TYPE" = "pull_request" ] && ! [ "$PUBLISH" = "false" ]; then
        ARTIFACTORY_REPO=hyc-cloud-private-integration-helm-local
        export ARTIFACTORY_REPO="$ARTIFACTORY_REPO"
    fi
fi

echo ARTIFACTORY_REPO=$ARTIFACTORY_REPO
