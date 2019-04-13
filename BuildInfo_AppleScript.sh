#!/bin/sh
# Capture build info including start time, tech ID, and intended user ID
tagRoot="/Users/Shared/OrgName_AppleScript"
mkdir -p $tagRoot

# Record start time and time zone offset
echo "$(date +"%D %H:%M")" > ${tagRoot}/BuildStarted.txt

#########################################################################
# Collect Tech ID name against JSS imaging accounts
techName=`/usr/bin/osascript <<EOT
		tell application "System Events"
			with timeout of 43200 seconds
			activate
			set myReply to text returned of (display dialog "Please enter your Tech ID (first.last):" default answer "" buttons {"Continue"} default button "Continue")
			end timeout
		end tell
		
EOT`
#write the Tech ID to our plist for collection later
echo "$techNameTest" > ${tagRoot}/TechID.txt


#########################################################################
# Collect end user id
endUser=`/usr/bin/osascript <<EOT
	tell application "SystemUIServer"
		with timeout of 43200 seconds
		activate
		set myReply to text returned of (display dialog "Please enter the end user's ID (first.last):" default answer "" buttons {"Continue"} default button "Continue")
		end timeout
	end tell
	
EOT`
# write the end user info to the plist
echo "$endUserTest" > ${tagRoot}/JLL_SAM.txt

#########################################################################
# Collect the TopGun Status from a list

topgunValue=`/usr/bin/osascript <<EOT
	tell application "SystemUIServer"
			activate
			with timeout of 600 seconds
			set topgunStatus to (choose from list {"Platinum", "Gold", "Silver", "Bronze", "None"} with prompt "Choose the appropriate\nbusiness unit:" default items {"None"})
			end timeout
	end tell
EOT`
#store the topgun status id
echo "$topgunValue" > ${tagRoot}/TopGun.txt

#########################################################################
# Collect computer name
computerName=`/usr/bin/osascript <<EOT
	tell application "SystemUIServer"
		with timeout of 43200 seconds
		activate
		set myReply to text returned of (display dialog "Please enter the computer name:" default answer "" buttons {"Continue"} default button "Continue")
		end timeout
	end tell
	
EOT`
# write the end user info to the plist
echo "$computerName" > ${tagRoot}/ComputerName.txt



#########################################################################
# Collect the Business ID from a list

businessID=`/usr/bin/osascript <<EOT
	tell application "SystemUIServer"
			activate
			with timeout of 600 seconds
			set businessID to (choose from list {"Corporate", "Hardened", "Retail"} with prompt "Choose the appropriate\nbusiness unit:" default items {"Corporate"})
			end timeout
	end tell
EOT`
#store the business id
echo "$businessID" > ${tagRoot}/BusinessID.txt

#########################################################################
# Collect the Country ID from a list
countryID=`/usr/bin/osascript <<EOT
tell application "SystemUIServer"
        activate
        with timeout of 600 seconds
        set businessID to (choose from list {"US", "CA", "MX", "BR"} with prompt "Choose the appropriate country:" default items {"US"})
        end timeout
end tell

EOT`
#store the country ID
echo "$countryID" > /tmp/tag/JLL_CountryID.txt