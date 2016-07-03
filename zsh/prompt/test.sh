#!/usr/bin/env zsh

#name=$PWD

[[ "$PWD" =~ ^"$HOME"(/|$) ]] && name="~${PWD#$HOME}"

echo $name
