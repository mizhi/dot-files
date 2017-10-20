#!/usr/bin/env bash

mkdir -p ~/.sbt/0.13/plugins
ln -sf `pwd`/sbt_plugins.sbt ~/.sbt/0.13/plugins/plugins.sbt
