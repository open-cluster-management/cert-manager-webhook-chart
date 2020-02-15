#!/bin/bash

export TARGET_VERSION=$(cat $TRAVIS_BUILD_PATH/COMPONENT_VERSION 2>/dev/null)
make helm/chart/build/package
