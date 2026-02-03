#!/bin/bash
FEATURE_FILE=$(basename "$1")
cd /workspaces/testKarate
mvn test -Dtest=RunnerTest -Dkarate.feature="$FEATURE_FILE"
