#!/bin/bash
# Copyright (c) 2024 Fluent Networks Pty Ltd & AUTHORS All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -m

# Enable IP forwarding
echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.conf
sysctl -p /etc/sysctl.conf

# Prepare run dirs
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

# Set root password
echo "root:${PASSWORD}" | chpasswd

# Execute startup script if it exists
if [[ -n "${STARTUP_SCRIPT}" && -f "${STARTUP_SCRIPT}" ]]; then
       bash "${STARTUP_SCRIPT}" || exit $?
fi

# Execute running script if it exists
if [[ -n "${RUNNING_SCRIPT}" && -f "${RUNNING_SCRIPT}" ]]; then
       bash "${RUNNING_SCRIPT}" || exit $?
fi

# Start SSH
/usr/sbin/sshd -D

fg %1
