Param(
	[Parameter(Mandatory = $true)][string]
	$path,
	[string]
	$config = "Release",
	[string]
	$platform = "x64"
)

$exists = Test-Path $path
$version = 0,0,0,0
$cn_version = 0,0,0,0

# Get version from existing file
if ($exists -and $(Get-Content $path | Out-String) -match "VERSION_FULL (\d+).(\d+).(\d+).(\d+)") {
	$version = [int]::Parse($matches[1]), [int]::Parse($matches[2]), [int]::Parse($matches[3]), [int]::Parse($matches[4])
}
elseif ($(git describe --tags) -match "v(\d+)\.(\d+)\.(\d+)(-\d+-\w+)?") {
	$version = [int]::Parse($matches[1]), [int]::Parse($matches[2]), [int]::Parse($matches[3]), 0
}

# Get ReShade CN version from existing file
if ($exists -and $(Get-Content $path | Out-String) -match "CN_VERSION_FULL (\d+).(\d+).(\d+).(\d+)") {
	$cn_version = [int]::Parse($matches[1]), [int]::Parse($matches[2]), [int]::Parse($matches[3]), [int]::Parse($matches[4])
}

# Increment build version for release builds
if (($config -eq "Release") -or
    ($config -eq "Release Signed")) {
	$cn_version[3] += 1
	"Updating version to $([string]::Join('.', $cn_version)) ..."
}
elseif ($exists) {
	return
}

$official = Test-Path ($path + "\..\sign.pfx")

# Update version file with the new version information
@"
#pragma once

#define VERSION_FULL $([string]::Join('.', $version))
#define VERSION_MAJOR $($version[0])
#define VERSION_MINOR $($version[1])
#define VERSION_REVISION $($version[2])
#define VERSION_BUILD $($version[3])

#define CN_VERSION_FULL $([string]::Join('.', $cn_version))
#define CN_VERSION_MAJOR $($cn_version[0])
#define CN_VERSION_MINOR $($cn_version[1])
#define CN_VERSION_REVISION $($cn_version[2])
#define CN_VERSION_BUILD $($cn_version[3])

#define VERSION_STRING_FILE "$([string]::Join('.', $cn_version))"
#define VERSION_STRING_PRODUCT "$([string]::Join('.', $cn_version)) base on ReShade $($version[0]).$($version[1]).$($version[2])"
"@ | Out-File -FilePath $path -Encoding ASCII
