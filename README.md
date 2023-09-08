# N9VEM TERMINAL CONFIGURATION

**Note**: The configuration is done in the directory: `C:\Users\<user>\.config`

## Step 1: Install Hack Nerd Fonts (Nerd Fonts)

Download and install the Hack Nerd Fonts from the following URL:

```
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
```

## Step 2: Change the font to Hack Nerd Font (Defaults)

## Step 3: Change color to One-Half Dark (Defaults)

## Step 4: Enable acrylic material (Defaults)

## Step 5: Enable "Use acrylic material in the tab row" (Appearance)

## Step 6: Install PowerShell

## Step 7: Change default shell to PowerShell

## Step 8: Install Scoop

Run the following PowerShell commands:

```PowerShell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex
```

## Step 9: Create PowerShell config directory

```PowerShell
mkdir .config/powershell
```

## Step 10: Create 'user_profile'

```PowerShell
nvim .config/powershell/user_profile.ps1
```

## Step 11: Paste code into .config/powershell/user_profile.ps1

```PowerShell
# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
# oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\bubblesextra.omp.json" | Invoke-Expression
oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\bubblesline.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
```

## Step 12: Change the current profile

Use your preferred text editor to open the current profile file:

```PowerShell
nvim $PROFILE.CurrentUserCurrentHost
```

or

```PowerShell
code $PROFILE
```

## Step 13: Paste code into the profile

```PowerShell
. $env:USERPROFILE\.config\powershell\user_profile.ps1
```

## Step 14: Install 'oh-my-posh'

```PowerShell
scoop install oh-my-posh
```

## Step 15: Invoke 'oh-my-posh' on the config file

```PowerShell
oh-my-posh.exe init pwsh | Invoke-Expression
```

## Step 16: Install Terminal Icons

```PowerShell
choco install terminal-icons.powershell
```

## Step 17: Install z - directory jumper

```PowerShell
Install-Module -Name z -Force
```

## Step 18: Install PSReadLine

```PowerShell
Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine -AllowPrerelease -Force
```

## Step 19: Install Fzf

```PowerShell
scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl-f' -PSReadlineChordReverseHistory 'Ctrl+r'
```

## Step 20: Install Touch

```PowerShell
npm install touch-cli -g
```

## Step 21: Install Sudo

```PowerShell
npm install --global yarn
```

## Step 22: Install Yarn

```PowerShell
choco install -y sudo
```

This README.md is now organized into clear steps with better formatting and headings, making it easier for users to follow the configuration process.
