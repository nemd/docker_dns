#!/bin/sh

mkdir -p -m 700 /var/unbound
chown unbound:unbound /var/unbound

unbound-anchor -a /var/unbound/root.key

exec unbound -c /etc/unbound/unbound.conf -d