#!/bin/bash
docker run -it amazonlinux:2 bash
yum install -y python3 zip
python3 -m pip install --upgrade pip
mkdir python
pip3 install pymupdf -t python/
zip -r pymupdf-layer.zip python
exit
# Copy zip from container to host with docker cp

