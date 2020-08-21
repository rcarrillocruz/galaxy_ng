#!/bin/bash

# WARNING: DO NOT EDIT!
#
# This file was generated by plugin_template, and is managed by it. Please use
# './plugin-template --travis galaxy_ng' to update this file.
#
# For more info visit https://github.com/pulp/plugin_template

set -uv

# check for imports not from pulpcore.plugin. exclude tests
MATCHES=$(grep -n -r --include \*.py "from pulpcore.*import" . \
    | grep -v "tests\|plugin" \
    | grep -v "repository.*add_and_remove" \
    | grep -v "pulpcore.app.*viewsets")

if [ $? -ne 1 ]; then
  printf "\nERROR: Detected bad imports from pulpcore:\n"
  echo "$MATCHES"
  printf "\nPlugins should import from pulpcore.plugin."
  exit 1
fi
