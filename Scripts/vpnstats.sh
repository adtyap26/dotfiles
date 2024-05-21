#!/bin/bash

if nmcli connection show --active | grep -q "thinkpadt480s.*wireguard"; then
  echo "[󰖂  WireGuard]"
elif nmcli connection show --active | grep -q "thinkpad"; then
  echo "[󰖂  OpenVPN]"
elif nmcli connection show --active | grep -q "Alldata-office"; then
  echo "[󰖂  Office]"
fi > /dev/stdout

