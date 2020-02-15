#!/bin/bash

export HELM_PACKAGE_PATH=stable/ibm-cert-manager-webhook
export CHART_NAME=$(cat $TRAVIS_BUILD_PATH/COMPONENT_NAME 2>/dev/null)
export TARGET_VERSION=$(cat $TRAVIS_BUILD_PATH/COMPONENT_VERSION 2>/dev/null)
make helm/chart/build/package
