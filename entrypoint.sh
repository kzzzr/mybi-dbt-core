#!/bin/bash -l

# set logging
set -e

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

banner "Install dependencies:"
dbt deps

banner "Check connection:"
dbt seed

banner "Check connection:"
dbt run

# banner "Build DWH:"
# dbt build && dbt run-operation "clean_up"
