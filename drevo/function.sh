#!/bin/sh
sudo echo 0 | pkexec tee /sys/module/hid_apple/parameters/fnmode
