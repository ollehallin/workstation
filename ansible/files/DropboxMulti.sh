#!/bin/bash
REAL_HOME=$HOME

for dropbox in .dropbox-personal .dropbox-crisp; do
    #echo -n "$dropbox "; read
    DROPBOXD="$REAL_HOME/$dropbox/.dropbox-dist/dropboxd"
    if ! [ -f "$DROPBOXD" ]; then
        mkdir -p "$REAL_HOME/$dropbox"
        ln -s "$REAL_HOME/.Xauthority" "$REAL_HOME/$dropbox/"
	cp -r /var/lib/dropbox/.dropbox-dist "$REAL_HOME/$dropbox"
    fi
    HOME="$REAL_HOME/$dropbox" nice $DROPBOXD > /tmp/${dropbox}.out 2>&1 &
done
