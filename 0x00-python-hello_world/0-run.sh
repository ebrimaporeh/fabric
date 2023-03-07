#!/bin/bash

# Check if PYFILE environment variable is set
if [[ -z "${PYFILE}" ]]; then
    echo "Error: PYFILE environment variable is not set"
    exit 1
fi

# Open the Python script in vi editor
vi $PYFILE

# Run the Python script
python $PYFILE


