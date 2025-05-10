#!/bin/bash

codesign --force --deep -s - /Applications/Lidarr.app
codesign --force --deep -s - /Applications/Radarr.app
codesign --force --deep -s - /Applications/Sonarr.app
