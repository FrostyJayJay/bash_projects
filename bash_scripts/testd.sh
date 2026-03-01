#!/usr/bin/env bash

# 1) Change Directory
# This tells the script to "go into" your folder first.
# The "|| exit" means If you cant find this folder stop so we dont break something.
cd "/Users/codyfuller/Documents/bash_workshop/bash_projects/testd" || exit

# 2) The Loop
# "for f in *" means For every file (f) inside the current folder (*)...
for f in *; do

# 3) the Safety Check
# This checks if "f" is a directory. If it is we continue aka skip it
# We dont want to try and inception a folder
if [ -d "$f" ]; then
    continue
    fi

# 4)The Logic "if statments"
# checks if the filename ends in .xxx
if [[ "$f" == *.txt ]]; then
    DEST="Documents"

    # if not then proceed with the below
elif [[ "$f" == *.zip ]]; then
    DEST="Archives"

elif [[ "$f" == *.pdf ]]; then
    DEST="Documents"

elif [[ "$f" == *.jpg ]]; then
    DEST="Images"

elif [[ "$f" == *.mp3 ]]; then
    DEST="Audio"

elif [[ "$f" == *.mov ]]; then
    DEST="Videos"

else 
    DEST="Cleanup"

fi

# 5) This part actually dose the work of moving the files
mv "$f" "$DEST/"

done

# 6) Gives apple notification when done
osascript -e 'display notification "All files have been organized!" with title "File Organizer"'