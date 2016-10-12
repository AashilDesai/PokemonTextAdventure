#!/bin/bash

numPokeballs=$( grep -c "POKEBALLS" ./data/inventory.txt )
numCATERPIE=$( grep -c "CATERPIE" ./data/pokemon.txt )

if [[ $1 == "intro" ]] 
	then
	echo "You are currently in the Viridian Forest." 
elif [[ $1 == "look" ]] && [[ $numCATERPIE -eq 0 ]]
	then
	echo "You're in a dark forest, with light to your north and south. You hear rustling to your left and jump back in fright, but it's only a Caterpie munching on a leaf."
elif [[ $1 == "look" ]] && [[ $numCATERPIE -gt 0 ]]
	then
	echo "You're in a dark forest, with light to your north and south."
elif [[ $1 == "catch" ]] && ([[ $2 == "CATERPIE" ]] || [[ $2 == "caterpie" ]] || [[ $2 == "Caterpie" ]])
	then
	if [[ $numCATERPIE -eq 0 ]] #it's impossible to reach this part without having pokeballs
		then
		echo "You throw a pokeball at the Caterpie."
		echo "It rolls once..."
		echo "Twice..."
		echo "Three times and it blinks. Congrats you've caught a CATERPIE"
		echo  -n " " >> ./data/pokemon.txt
		echo  -n "CATERPIE" >> ./data/pokemon.txt
	elif [[ $numCATERPIE -gt 0 ]] #so you already have a CATERPIE
		then
		echo "You've already caught a pokemon on this route! Maybe you should keep moving."
	fi
elif [[ $1 == "go" ]]
	 then
	if [[ $2 == "south" ]]
		then
		exit 3
	elif [[ $2 == "west" ]] ||  [[ $2 == "east" ]]
		then
		echo "It is way to dark in here and the forest is starting to creep you out. Perhaps it's best not to go that way"
	elif [[ $2 == "north" ]]
		then
		exit 6
	fi
else
	echo "Professor Oak's voice echoes in your head. \"Red! There's a time and place for everything, but not now!\""
fi