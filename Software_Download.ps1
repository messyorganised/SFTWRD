# Base Software Path
$ScriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$SoftPath = "$ScriptPath\Software\"

# Software Download Links
$softwareDownloads = @{
    "Chrome.exe" = 'https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B06A9BED7-01F5-9923-D88E-15E816E115E9%7D%26lang%3Den-GB%26browser%3D4%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe'
    "AReader.exe" = 'https://admdownload.adobe.com/rdcm/installers/live/readerdc64.exe'
    
}

# Function to download software
function Download.Software {
    param (
        [string]$downloadLink,
        [string]$outputFilename
    )
    
    $outputPath = Join-Path -Path $SoftPath -ChildPath $outputFilename
    Invoke-WebRequest -Uri $downloadLink -OutFile $outputPath
}

function Create.New.Folder {
    New-Item -Path "$ScriptPath" -Name "Software" -ItemType Directory
    
}

#param [string] = declare the call type as a string


# Start software downloads
foreach ($i in $softwareDownloads.GetEnumerator()) {
    Download.Software -downloadLink $i.Value -outputFilename $i.Key
    write-host "
    $i download completed.
    "
}
