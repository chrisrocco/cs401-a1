#!/usr/bin/env bash

docker build -t pgm-lng-runtime .
docker run -it -v $(pwd):/app pgm-lng-runtime