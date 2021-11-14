#!/bin/bash
# Put in an adress and it will reverse it
echo $1 | grep -o .. | sed 's/^/\\x/' | tac | tr -d '\n'
