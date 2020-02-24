#!/bin/bash

TEXDIR="${PWD}"
IMAGE="ldz/texlive:latest"

docker run -v ${TEXDIR}:/data ${IMAGE} make
