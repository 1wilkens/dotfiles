#!/bin/sh

set -ex

FLUTTER_PACKAGE="flutter"

yay -S --overwrite "/opt/flutter/*" "${FLUTTER_PACKAGE}"
