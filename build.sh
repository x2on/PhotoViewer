#!/bin/bash

#  Automatic build script for libPhotoViewer 
#  for iOS and iOSSimulator
#
#  Created by Felix Schulze on 06.06.11.
#  Copyright 2011 Felix Schulze. All rights reserved.
###########################################################################
#
SDKVERSION="4.3"
#
###########################################################################
#
# Don't change anything here
DEVICESDK="iphoneos${SDKVERSION}"
SIMSDK="iphonesimulator${SDKVERSION}"

echo "Building libPhotoViewer for iPhoneSimulator and iPhoneOS ${SDKVERSION}"
# Clean the targets
if ! xcodebuild -project "photoviewer.xcodeproj" -target photoviewer -configuration "Release" -sdk "$DEVICESDK" clean ; then
	exit 1
fi
if ! xcodebuild -project "photoviewer.xcodeproj" -target photoviewer -configuration "Release" -sdk "$SIMSDK" clean ; then
	exit 1
fi

# Build the targets
if ! xcodebuild -project "photoviewer.xcodeproj" -target photoviewer -configuration "Release" -sdk "$DEVICESDK" build ; then
	exit 1
fi
if ! xcodebuild -project "photoviewer.xcodeproj" -target photoviewer -configuration "Release" -sdk "$SIMSDK" build ; then
	exit 1
fi

echo "Build library..."
lipo "build/Release-iphoneos/libphotoviewer.a" "build/Release-iphonesimulator/libphotoviewer.a" -create -output "libphotoviewer.a"
cp -R build/Release-iphoneos/include .
echo "Building done."
