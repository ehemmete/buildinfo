#!/bin/bash

# Run the application and wait for it to finish
#/usr/bin/open -W -a /Applications/BuildInfo.app

# Collect the output from the .app for use in this script
tagRoot="/Users/Shared/OrgName"

BuildStarted=$(cat ${tagRoot}/BuildStarted.txt)
BuildTech=$(cat ${tagRoot}/BuildTech.txt)
AssignedUser=$(cat ${tagRoot}/AssignedUser.txt)
TopGunStatus=$(cat ${tagRoot}/TopGun.txt)
BusinessUnit=$(cat ${tagRoot}/BusinessUnit.txt)
CountryCode=$(cat ${tagRoot}/CountryCode.txt)

# Do the rest of the setup using these values
