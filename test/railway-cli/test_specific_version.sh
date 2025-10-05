#!/bin/bash

set -e

source dev-container-features-test-lib

check "railway existence" railway --version
check "railway CLI version is v4.9.0" sh -c "railway --version | grep '4.9.0'"

reportResults