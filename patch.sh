#!/bin/sh

set -eu

cd gtk/.themes/FlatColor
git apply ../../../_patches/flatcolor.patch
