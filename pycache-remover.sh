#!/bin/bash


find . -type d -name __pycache__ -prune -exec rm -r {} \;
