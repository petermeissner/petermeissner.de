#!/bin/bash

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:stable \
  jekyll build --trace

cp ./_site/* /home/peter/server/sites/petermeissner.de/ -r
