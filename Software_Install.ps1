# Base Software Path
$ScriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$SoftwareFolderPath = "$($ScriptPath)/Software"


# Software Download Links
#Always remember to put comma for each line except the final line
$softwareInstalled = @(
    #Enter your File name here

    "Chrome.exe",
    "AReader.exe",
    "OfficeSetup.exe"
    
)

# Function to download software
#param [string] = declare the call type as a string
function InstallSoftware {
    param (
        [string]$FileName
    )
    start-process "$SoftwareFolderPath\$FileName"
}

# Start software downloads
foreach ($i in $softwareInstalled) {
    InstallSoftware -Filename $i -wait
    write-host "$i install completed."  -Seperator "`n"
}
