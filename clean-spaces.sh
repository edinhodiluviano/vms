#!/bin/bash


find . -type f -name '*.py' -prune -exec sed -i 's/\s*$//' {} \;
