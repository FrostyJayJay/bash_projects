#!/usr/bin/env bash

#Tells the computer what todays date it. Stuff inside the () is the actually command for what is the date
TODAY=$(date +%Y-%m-%d)

#Table saw guard. Keeps you from turning on the saw in the wrong spot. Pipes mean OR so if saw is in wrong spot exit (lockout)
cd "/Users/codyfuller/Documents/bash_workshop/bash_projects/redate" || exit

#Instead of f for file. I named it every_item because it reads more clear. so for every item (file) in this folder DO the following code below this
for every_item in *
 do

#This is one of the table saw safeties. It checks if somethink is a folder. Then if it IS a folder the CONTINUE command kicks it off the cut list for the saw. Its backwards to think this way but otherwise instead of removing a specific type of board from the cut list you then have to list all the boards that can be cut by the saw. You can hand over the dollar bill or you can count out the change.
if [ -d "$every_item" ]
then 
continue
fi

#This saw guard is stating if a board is on the cut list and is already cut to lengh then CONTINUE (remove it from the cut list) This keeps things from being double dated and so on and so on. 
if [[ "$every_item" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}_ ]]
then
continue
fi

#This is the actual cutting part of the code. We are saying rename every item in this folder to todays date+filename
mv "$every_item" "${TODAY}_$every_item"
done

#This is the rack where we put the cut pieces. It shows a nice tidy window in MacOs telling us script is complete and done.
osascript -e "display notification \"All fresh files are now dated.\" with title \"Redate Complete\""


#[[ ... ]]: These double brackets are the "Advanced Testing Ground." They allow us to do "Pattern Matching" (Regex), which the single brackets [ ] can't do.

#=~: This is the Regex Operator. It says: "Does the variable on the left match the pattern on the right?"

#^: This little hat means "At the very beginning." We only care if the date is the very first thing in the filename.

#[0-9]{4}: This means "Exactly four digits." (The year: 2026).

#-: A literal dash.

#[0-9]{2}: "Exactly two digits." (The month: 03).

#-: Another dash.

#[0-9]{2}: "Exactly two digits." (The day: 01).

#_: A literal underscore.