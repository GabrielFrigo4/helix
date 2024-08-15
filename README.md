# helix
Gabriel Frigo Helix Configuration

# config.toml
Helix File Configuration

# helix.sh
Helix File Startup in Linux using Flatpak
```bash
#!/bin/bash

flatpak run com.helix_editor.Helix $@
echo -e -n "\x1b[\x30 q"
```

# [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
```bash
apt install wl-clipboard
```
