# Enable necessary Windows features for WSL2 (should be done by `wsl --install`)
# Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
# Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName Microsoft-Hyper-V-All
# Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName HypervisorPlatform
# Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName VirtualMachinePlatform

# Install WSL and the default distro Ubuntu
wsl --install

# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0