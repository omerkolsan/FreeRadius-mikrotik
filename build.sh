#!/usr/bin/env sh
# Copyright (c) 2024 Fluent Networks Pty Ltd & AUTHORS All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.
#
# Updates freeradius respository and runs `docker build` with flags configured for 
# docker distribution. 
# 
#
# Set PLATFORM as required for your router model. See:
# https://mikrotik.com/products/matrix
#
PLATFORM="linux/arm64"
VERSION=1.0.0

set -eu

rm -f freeradius.tar

docker buildx build \
  --platform $PLATFORM \
  --builder arm64-builder \
  --load -t mikrotik-freeradius:$VERSION .

skopeo copy \
    docker-daemon:mikrotik-freeradius:$VERSION \
    docker-archive:freeradius.tar
