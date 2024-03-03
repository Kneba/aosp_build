#!/bin/bash

set -e

# Initialize repo with specified manifest
repo init --depth 1 -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs
crave set --projectID 72

crave run --no-patch -- rm -rf .repo/local_manifests && repo init --depth=1 --no-repo-verify -u https://github.com/ProjectBlaze/manifest -b 14 --git-lfs -g default,-mips,-darwin,-notdefault && git clone --depth=1 https://github.com/Tiktodz/local_manifest -b blaze .repo/local_manifests && repo sync -c -j $(nproc --all) --force-sync && export BUILD_USERNAME=Tiktodz && export BUILD_HOSTNAME=crave && export TZ=Asia/Jakarta && source build/envsetup.sh && lunch blaze_X00TD-userdebug && make bacon
