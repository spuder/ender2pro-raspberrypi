#!/bin/bash

# Verify running on OSX / Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux detected"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "OSX detected"
else
    echo "Unsupported OS"
    echo "While windows _may_ work it is untested. Feedback/Pull Requests welcome."
    exit 1
fi

# Verify docker is installed
if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker is not installed. Please install docker and try agian' >&2
    exit 1
fi

# Verify make is installed
if ! [ -x "$(command -v make)" ]; then
    echo 'Error: make is not installed. Please install "make" and try agian' >&2
    exit 1
fi

# Verify git is installed
if ! [ -x "$(command -v git)" ]; then
    echo 'Error: git is not installed. Please install "git" and try agian' >&2
    exit 1
fi

# Check if CAD-scripts folder is present and is a git submodule 
git submodule init
git submodule update
cd ./CAD-scripts/ && git checkout main && cd ..

echo ""
echo "--------------------------------------------------------------------------------------------------"
echo "Congratulations, CAD-template is setup. Please run the following commands to start using this repo"
echo ""
echo "1.   make setup                      # This will delete the prepopulated templates (only ever needs to be run once)"
echo "2.   make all                        # This will generate new templates and images"