#!/bin/bash

TEXDIR="${PWD}"
IMAGE="wirecardtecdoc/texlive:latest"

docker run -v ${TEXDIR}:/data ${IMAGE} make -j8
