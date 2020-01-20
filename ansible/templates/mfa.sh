#!/usr/bin/env bash
if [[ -z "$1" ]]; then
    echo """\
Usage: $0 <account>
   where <account> is resolved to $HOME/.aws/<account>.mfa\
"""
    exit 1
fi

declare mfaFile="$HOME/.aws/$1.mfa"
if [[ ! -O "${mfaFile}" ]]; then
    echo "No such file or not readable by me: $mfaFile"
    exit 2
fi

oathtool --base32 --totp "$(cat ${mfaFile})" ;
