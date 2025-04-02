#!/bin/bash
rm -f "Documents/videos.js"
printf "options.videos = [\n" > "Documents/videos.js"
find Documents/videos/. -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.m4v" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.webm" \) -exec basename {} \; | sort | awk '{print "\"videos/" $0 "\","}'  >> "Documents/videos.js"
printf "];\n" >> "Documents/videos.js"
printf "// Last updated: %s\n" "$(date '+%Y-%m-%d %H:%M:%S')" >> "Documents/videos.js"
printf "options.lastUpdated = %d;\n" "$(date +%s)" >> "Documents/videos.js"
