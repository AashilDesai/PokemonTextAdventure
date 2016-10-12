#!/bin/bash

numPokeballs=$( grep -c "POKEBALLS" ./data/inventory.txt )
numPidgey=$( grep -c "PIDGEY" ./data/pokemon.txt )

if [[ $1 == "intro" ]] 
	then
	echo "You are currently on Route 1." 
elif [[ $1 == "look" ]] && [[ $numPidgey -eq 0 ]]
	then
	echo "You're on a clean dirt road that runs from North to South. A Pidgey lands nearby and stares at you before giving a brief hoot."
elif [[ $1 == "look" ]] && [[ $numPidgey -gt 0 ]]
	then
	echo "You're on a clean dirt road that runs from North to South."
elif [[ $1 == "catch" ]] && ([[ $2 == "pidgey" ]] || [[ $2 == "Pidgey" ]] || [[ $2 == "PIDGEY" ]])
	then
	if [[ $numPidgey -eq 0 ]] && [[ $numPokeballs -gt 0 ]] #so you have no pidgy's and POKEBALLS
		then
		echo "You throw a pokeball at the Pidgey."
		echo "It rolls once..."
		echo "Twice..."
		echo "Three times and it blinks. Congrats you've caught a PIDGEY"
		echo  -n " " >> ./data/pokemon.txt
		echo  -n "PIDGEY" >> ./data/pokemon.txt
	elif [[ $numPidgey -eq 0 ]] && [[ $numPokeballs -eq 0 ]] # you have no pidgey's, but you have no pokeballs 
		then
		echo "The Pidgey stares at you without blinking. If only you had some pokeballs to catch it with!"
	elif [[ $numPidgey -gt 0 ]] #so you already have a pidgey
		then
		echo "You've already caught a pokemon on this route! Maybe you should keep moving."
	fi
elif [[ $1 == "go" ]]
	 then
	if [[ $2 == "south" ]]
		then
		exit 1
	elif [[ $2 == "west" ]] ||  [[ $2 == "east" ]]
		then
		echo "The trees that way are thick. Perhaps it's best not to go that way"
	elif [[ $2 == "north" ]]
		then
		exit 3
	fi
else
	echo "Professor Oak's voice echoes in your head. \"Red! There's a time and place for everything, but not now!\""
fi