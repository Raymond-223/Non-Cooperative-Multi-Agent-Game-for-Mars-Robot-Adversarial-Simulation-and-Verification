#!/bin/bash
# Reassemble the Docker image archive from split parts
# Usage: bash reassemble.sh

cat test_noetic_withdata_aarch64.tar.gz.part*.part > test_noetic_withdata_aarch64.tar.gz
echo "Reassembled: test_noetic_withdata_aarch64.tar.gz"
echo "Verify with: ls -lh test_noetic_withdata_aarch64.tar.gz"
echo "Load with: sudo gunzip -c test_noetic_withdata_aarch64.tar.gz | sudo docker load"
