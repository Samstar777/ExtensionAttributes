#!/bin/bash

# Current Logged in User
loggedInUser=$(stat -f %Su /dev/console)

# Define the Chrome extensions directory (Change this path if needed)
CHROME_EXT_DIR="/Users/$loggedInUser/Library/Application Support/Google/Chrome/Default/Extensions"
# Check if the Chrome extensions directory exists
if [ ! -d "$CHROME_EXT_DIR" ]; then
	echo "<result>No Chrome extensions directory found</result>"
	exit 1
fi

# Initialize an empty variable to store the extensions info
output=""

# Iterate through each extension directory
for ext_dir in "$CHROME_EXT_DIR"/*/; do
	ext_id=$(basename "$ext_dir")
	
	# Iterate through version folders
	for version_dir in "$ext_dir"*/; do
		manifest_file="${version_dir}manifest.json"
		
		if [ -f "$manifest_file" ]; then
			ext_name=$(jq -r '.name' "$manifest_file")
			ext_version=$(jq -r '.version' "$manifest_file")
			ext_description=$(jq -r '.description' "$manifest_file")
			
			# Append each extension's info in a new line
			output+="$ext_name (ID: $ext_id, Version: $ext_version)\n"
		fi
	done
done

# If no extensions are found, set a default message
if [ -z "$output" ]; then
	output="No extensions found"
fi

# Output the result in a format that JAMF can read
echo "<result>$(echo -e "$output")</result>"