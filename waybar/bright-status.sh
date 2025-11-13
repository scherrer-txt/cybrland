#!/usr/bin/env bash

bus=4
val=$(/usr/bin/ddcutil --bus="$bus" getvcp 10 2>/dev/null \
  | grep -Eo 'current value = *[0-9]+' \
  | grep -Eo '[0-9]+' \
  | tr -d '\r\n')

if [[ ! "$val" =~ ^[0-9]+$ ]]; then
  echo '{"text":"??%","tooltip":"no data","percent":0}'
  exit 0
fi

if   (( val >= 90 )); then
  icon=""; class="max"
elif (( val >= 70 )); then
  icon=""; class="high"
elif (( val >= 40 )); then
  icon=""; class="mid"
elif (( val >= 10 )); then
  icon=""; class="low"
else
  icon=""; class="min"
fi

echo "{\"text\":\"${icon}\",\"tooltip\":\"${val}%\",\"percent\":${val},\"class\":\"${class}\"}"