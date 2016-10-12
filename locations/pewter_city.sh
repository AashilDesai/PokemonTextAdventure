#!/bin/bash

numPokemon=$( wc -w  < ./data/pokemon.txt )

if [[ $1 == "intro" ]] 
	then
	echo "You are currently in Pewter City" 
elif [[ $1 == "look" ]] 
	then
	echo "You're standing in the square of a large city. Also in the square are Brock (the Pewter City Gym Leader), and a Boy. There's a path to your right, but it's closed due to construction. There is a road to your south."
elif [[ $1 == "talk" ]] && [[ $2 == "to" ]] && (([[ $3 == "boy" ]] || [[ $3 == "Boy" ]]) ||  ([[ $3 == "the"  ]] && ([[ $4 == "boy" ]] || [[ $4 == "Boy" ]])))
	then
	echo "Boy: \"You're a million light years from facing Brock!\""
	#this huge mess is basically "talk to the Pokemart Employee", "talk to the pokemart employee", "talk to Pokemart Employee", and "talk to pokemart employee"
elif [[ $1 == "talk" ]] && [[ $2 == "to" ]] && ([[ $3 == "Brock" ]] || [[ $3 == "brock" ]])
	then
	echo "Brock \"Welcome to Pewter City! My name is Brock, the Gym Leader. I will battle you and see if you are worthy of the Boulder Badge.\""
	if [[ $numPokemon -gt 2 ]] #so you have 3 pokemon
		then
		echo "Congrats! Your team is strong enough to defeat me! I am pleased to award you the BOULDER BADGE."
		exit 7
	else
		echo "Sadly, your team is too weak to face me. Perhaps capturing more pokemon will let you beat me next time!"
	fi
elif [[ $1 == "go" ]]
	 then
	if [[ $2 == "south" ]]
		then
		exit 5
	elif [[ $2 == "east" ]]
		then
		echo "The road to the east is blocked by construction"
	elif [[ $2 == "west" ]] || [[ $2 == "north" ]]
		then
		echo "The trees that way are pretty thick. Don't go this way."
	fi
else
	echo "Professor Oak's voice echoes in your head. \"Red! There's a time and place for everything, but not now!\""
fi