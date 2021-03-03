# Copyright Contributors to the Open Cluster Management project

#!/bin/bash

make packages/install/yq
make packages/install/helm
make helm/chart/build/package
