#! /usr/bin/env bash

set -x

if [ -n "$PUPPET_VERSION" ]; then
  additional_opts="--puppet-version $PUPPET_VERSION"
elif [ -n "$PE_VERSION" ]; then
  additional_opts="--pe-version $PE_VERSION"
else
  additional_opts=""
fi

if [ -n "$MODULE_DIR" ]; then
  cd $MODULE_DIR && pdk validate --format=text $additional_opts
else
  pdk validate --format=text $additional_opts
fi