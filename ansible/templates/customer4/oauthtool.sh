#!/usr/bin/env bash
declare profile=${1:-{{ secrets.customer4.product }}}
oathtool --base32 --totp "$(cat ~/.aws/${profile}.mfa)" ;
