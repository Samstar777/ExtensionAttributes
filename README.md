# ExtensionAttributes
Jamf Pro Extension Attribute Library

## 1. Major Part of Office License EA has been taken from pbowden-msft Paul Bowden GitHub resource.

## 2. Chrome Extension Attribute Script for Jamf Pro
### Overview

This script collects and reports information about Google Chrome extensions installed for the currently logged-in user on macOS devices. It is specifically tailored for use as an Extension Attribute in Jamf Pro, aiding in device monitoring and management.

### Features

- Identifies all installed Chrome extensions for the logged-in user.

- Outputs the details in a Jamf Pro-compatible format.

- Includes error handling for scenarios where Chrome or its extensions directory is not found.

### Requirements

- macOS device managed via Jamf Pro.

- Google Chrome installed on the device.

### Usage

- Log in to your Jamf Pro instance.

- Navigate to Computer Management > Extension Attributes.

- Create a new Extension Attribute and paste the contents of the script.

- Save and deploy the Extension Attribute to the desired computer group.

### Script Functionality

- Identifies the current logged-in user.

- Locates the Chrome extensions directory for the user.

- Iterates through each extension to collect details.

- Outputs the extension names and IDs in the required format for Jamf Pro.

### Example Output

#### If Chrome extensions are found, the script will output:

<result>
Extension Name 1 (Extension ID 1)
Extension Name 2 (Extension ID 2)
...
</result>

#### If no extensions are found or Chrome is not installed:

<result>No Chrome extensions directory found</result>

### Notes

- Ensure the script is executed with appropriate permissions to access user directories.

- Adjust the CHROME_EXT_DIR variable in the script if the Chrome extensions directory path differs in your environment.

### License

This project is licensed under the MIT License. Feel free to modify and distribute as per your requirements.
