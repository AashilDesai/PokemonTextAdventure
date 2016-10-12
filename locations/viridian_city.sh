#!/bin/bash

numPokeballs=$( grep -c "POKEBALLS" ./data/inventory.txt )
numPackage=$( grep -c "PACKAGE" ./data/inventory.txt )

if [[ $1 == "intro" ]] 
	then
	echo "You are currently in Viridian City" 
elif [[ $1 == "look" ]] 
	then
	echo "You're standing in the middle of a small city. There are dirt paths to your west, north, and south. Standing in front of you are an Old Man and a Pokemart Employee"
#this huge mess is basically "talk to the old man", "talk to the Old Man", "talk to old man", and "talk to Old Man"
elif [[ $1 == "talk" ]] && [[ $2 == "to" ]] && ((([[ $3 == "Old" ]] || [[ $3 == "old" ]]) && ([[ $4 == "Man" ]] || [[ $4 == "man" ]])) ||  ([[ $3 == "the"  ]] && ([[ $4 == "Old" ]] || [[ $4 == "old" ]]) && ([[ $5 == "Man" ]] || [[ $5 == "man" ]])))
	then
	echo "Old Man: \"I'm waiting for my granddaughter to fetch me my morning coffee.\""
	#this huge mess is basically "talk to the Pokemart Employee", "talk to the pokemart employee", "talk to Pokemart Employee", and "talk to pokemart employee"
elif [[ $1 == "talk" ]] && [[ $2 == "to" ]] && ((([[ $3 == "Pokemart" ]] || [[ $3 == "pokemart" ]]) && ([[ $4 == "Employee" ]] || [[ $4 == "employee" ]])) ||  ([[ $3 == "the"  ]] && ([[ $4 == "Pokemart" ]] || [[ $4 == "pokemart" ]]) && ([[ $5 == "Employee" ]] || [[ $5 == "employee" ]])))
	then
	if [[ $numPokeballs -eq 0 ]] && [[ $numPackage -eq 0 ]]
		then
		echo "Pokemart Employee: \"Say, are you from Pallet Town? That means you must know Professor Oak. Do you mind delivering this package to him for me? He hasn't picked up his order yet from my shop.\""
		echo "Obtained the PACKAGE!"
		echo -n "PACKAGE" >> ./data/inventory.txt
	elif [[ $numPokeballs -eq 0 ]] && [[ $numPackage -gt 0 ]]
		then
		echo "Pokemart Employee: \"Can you get Professor Oak his package ASAP? Thanks! I'm really counting on you!\""
	elif [[ $numPokeballs -gt 0 ]]
		then
		echo "Pokemart Employee: \"Thanks a ton for getting Oak his package! You really helped me out!\""
	fi
elif [[ $1 == "go" ]]
	 then
	if [[ $2 == "south" ]]
		then
		exit 2
	elif [[ $2 == "east" ]]
		then
		echo "The trees that way are thick. Perhaps it's best not to go that way"
	elif [[ $2 == "north" ]]
		then
		if [[ $numPokeballs -gt 0 ]]
			then
			exit 5
		else
			echo "The Old Man steps in front of you to block your way."
			echo "Old Man: \"I think this nice Pokemar Employee could use some help. Why don't you ask her and see what you can do? I swear, young people these days...\""
		fi
	elif [[ $2 == "west" ]]
		then
		exit 4
	fi
else
	echo "Professor Oak's voice echoes in your head. \"Red! There's a time and place for everything, but not now!\""
fi