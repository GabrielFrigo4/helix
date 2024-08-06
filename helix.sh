#!/bin/bash

flatpak run com.helix_editor.Helix $@
echo -e -n "\x1b[\x30 q"