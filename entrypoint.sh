#!/bin/bash -l

# set logging
set -ex

banner() {
    echo
    echo "*** $*  ***"
}

# cd to project directory which is ./ by default
cd ${INPUT_PROJECT_DIR:-.} 

# perform actions
banner "Current dbt version:"
dbt --version

banner "Check connection:"
dbt debug

banner "Check connection:"
dbt seed

banner "Check connection:"
dbt run

# banner "Install dependencies:"
# dbt deps

# banner "Build DWH:"
# dbt build && dbt run-operation "clean_up"
