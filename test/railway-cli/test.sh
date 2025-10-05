#!/bin/bash

set -e

source dev-container-features-test-lib

check "railway existence" railway --version

reportResults