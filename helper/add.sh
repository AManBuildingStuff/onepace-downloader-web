#!/bin/zsh
# Receives  onepace-dl://add?m=<urlencoded magnet>&m=<urlencoded magnet>...
# and hands each magnet to Transmission in the background.
LOG="$HOME/Library/Logs/OnePaceHelper.log"
url="$1"
query="${url#*\?}"
[[ "$query" == "$url" ]] && query=""
count=0
for part in ${(s:&:)query}; do
  [[ "$part" == m=* ]] || continue
  enc="${part#m=}"
  enc="${enc//+/ }"
  magnet="$(printf '%b' "${enc//\%/\\x}")"
  [[ "$magnet" == magnet:\?* ]] || { print -r -- "$(date '+%F %T') skipped non-magnet" >> "$LOG"; continue; }
  if [[ -n "$ONEPACE_DRY_RUN" ]]; then
    print -r -- "$magnet"
  else
    /usr/bin/open -g -a Transmission "$magnet"
    sleep 0.3
  fi
  count=$((count + 1))
done
print -r -- "$(date '+%F %T') added $count magnet(s)" >> "$LOG"
