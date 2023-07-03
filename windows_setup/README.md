# Windows Setup
This folder contains config files and scripts for the intial setup of my Windows machine.

# Windows Features
To install necessary Windows features, execute `windows_features.ps1`.

## Packages
I use chocolatey as a package manager for Windows. If you don't have chocolatey installed, you can execute `installChocolatey.cmd` to install chocolatey. Afterwards, to install one of my presets of packages, navigate to the folder and enter:
```
choco install packages.config
```
Execute the `pinAutoUpdatePackages.ps1` Powershell script to pin software tools that usually update themselves after installation so that chocolatey only handles the initial installation.