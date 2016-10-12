#!/bin/bash

numPokeballs=$( grep -c "POKEBALLS" ./data/inventory.txt )
numMANKEY=$( grep -c "MANKEY" ./data/pokemon.txt )

if [[ $1 == "intro" ]] 
	then
	echo "You are currently on Route 22." 
elif [[ $1 == "look" ]] && [[ $numMANKEY -eq 0 ]]
	then
	echo "You're standing in front of a large gate to your north, but your path is blocked by a Guard. There is a dirt path leading east to Viridian City. Sitting next to the path givnig you odd looks is a wild Mankey."
elif [[ $1 == "look" ]] && [[ $numMANKEY -gt 0 ]]
	then
	echo "You're standing in front of a large gate to your north, but your path is blocked by a Guard. There is a dirt path leading east to Viridian City."
elif [[ $1 == "catch" ]] && ([[ $2 == "mankey" ]] || [[ $2 == "Mankey" ]] || [[ $2 == "MANKEY" ]])
	then
	if [[ $numMANKEY -eq 0 ]] && [[ $numPokeballs -gt 0 ]] #so you have no mankey's and POKEBALLS
		then
		echo "You throw a pokeball at the Mankey."
		echo "It rolls once..."
		echo "Twice..."
		echo "Three times and it blinks. Congrats you've caught a MANKEY"
		echo  -n " " >> ./data/pokemon.txt
		echo  -n "MANKEY" >> ./data/pokemon.txt
	elif [[ $numMANKEY -eq 0 ]] && [[ $numPokeballs -eq 0 ]] # you have no MANKEY's, but you have no pokeballs 
		then
		echo "The Mankey tits its head to the side, almost like it's laughing at you. If only you had some pokeballs to catch it with!"
	elif [[ $numMANKEY -gt 0 ]] #so you already have a MANKEY
		then
		echo "You've already caught a pokemon on this route! Maybe you should keep moving."
	fi
elif [[ $1 == "talk" ]] && [[ $2 == "to" ]] && (([[ $3 == "guard" ]] || [[ $3 == "Guard" ]]) ||  ([[ $3 == "the"  ]] && ([[ $4 == "Guard" ]] || [[ $4 == "guard" ]])))
	then
	echo "Guard: \"Don't talk to me until you've obtained all 8 Gym Badges.\""
elif [[ $1 == "go" ]]
	 then
	 if [[ $2 == "west" ]] ||  [[ $2 == "south" ]]
		then
		echo "The trees that way are thick. Perhaps it's best not to go that way."
	 elif [[ $2 == "east" ]]
		then
		exit 3
	 elif [[ $2 == "north" ]]
		then
		echo "You read a sign posted on top of the gate. \"ONLY TRAINERS WHO HAVE OBTAINED ALL 8 GYM BADGES MAY PROCEED TO VICTORY ROAD.\" Looks like you're not ready to head this way."
	fi
else
	echo "Professor Oak's voice echoes in your head. \"Red! There's a time and place for everything, but not now!\""
fi

