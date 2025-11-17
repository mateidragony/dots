#!/bin/bash

if [[ "$1" == "--org-capture" ]]; then
	emacsclient -c -e '(mc/org-capture-frame "g")' -F '((name . "**Capture**"))'
elif [[ "$1" == "--org-agenda" ]]; then
	emacsclient -c -e '(mc/org-agenda-frame "o")' -F '((name . "**Agenda**"))'
fi
