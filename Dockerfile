# Copyright (c) 2020 Fluent Networks Inc & AUTHORS All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

FROM alpine:3.22

RUN apk update

RUN apk add --no-cache ca-certificates iptables iptables-legacy iproute2 bash nano openssh curl jq sqlite sqlit-dev

RUN ln -s /usr/sbin/iptables-legacy /usr/local/bin/iptables
RUN ln -s /usr/sbin/ip6tables-legacy /usr/local/bin/ip6tables

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

COPY sshd_config /etc/ssh/

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh    

EXPOSE 22

EXPOSE 1812/udp
EXPOSE 1813/udp

CMD ["/usr/local/bin/entrypoint.sh"]

