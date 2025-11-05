# KRotate

Keyboard shortcuts scripts to rotate whole screen to left or right. It works by storing current state in the state file `$HOME/.config/krotate.rc` and doing appropriate rotation for a given keystroke. This script is based on `kscreen-doctor`.

## install
You have to create two shortcuts here.

1. copy `krotate-left.sh` and `krotate-left.sh` to some folder (like `~/.local/bin/krotate-left.sh`)

2. To assign left rotation, Goto `System settings -> Keyboard -> Shortcuts -> Add New -> Command or script`. For `command` field, provide full path for the above scripts (`~/.local/bin/krotate-left.sh`), and some name
3. Add your required shortcut like `Meta+]`
5. Repeat same for `krotate-right.sh`