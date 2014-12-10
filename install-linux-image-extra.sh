#!/bin/bash
DEBIAN_FRONTEND=noninteractive apt-get install -y linux-image-extra-$(uname -r)
