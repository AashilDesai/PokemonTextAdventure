#!/bin/bash

numPokeballs=$( grep -c "POKEBALLS" ./windows/inventory.txt )
numPackage=$( grep -c "PACKAGE" ./windows/inventory.txt )
numPokemon=$( wc -w  < ./windows/pokemon.txt )


if [[ $1 == "intro" ]] 
	then
	echo "You are currently in Pallet Town." 
elif [[ $1 == "look" ]]
	then
	echo "You are standing in the middle of a small town. Nearby is Professor Oak. There is an opening in the trees to the north." 
elif [[ $1 == "talk" ]] && [[ $2 == "to" ]] && ([[ $3 == "Professor" ]] || [[ $3 == "professor" ]]) && ([[ $4 == "Oak" ]] || [[ $4 == "oak" ]])
	then
		if [[ $numPokeballs -gt 0 ]]
			then
			echo "Professor Oak: \"Now that you can catch pokemon, go all the way to Pewter City! If you have enough pokemon you might even defeat Brock to win the Boulder Badge!\""
		elif [[ $numPackage -gt 0 ]]
			then
			echo "Professor Oak: \"Woah! Thanks so much for delivering my package to me! As a thanks, why not take some of these POKEBALLS. I think I accidentally ordered too many anyway.\""
			echo "Obtained the POKEBALLS!"
			echo -n "POKEBALLS" > ./windows/inventory.txt
		else
			echo "Professor Oak: \"Welcome to the wonderful world of Pokemon! My name is Professor Oak, and I'm here to help guide you on your quests\""
		fi 
elif [[ $1 == "go" ]]
	 then
		if [[ $2 == "south" ]]
			then
			echo "Unfortunately there is a sea to the south. Perhaps it's best not to go that way"
		elif [[ $2 == "west" ]] ||  [[ $2 == "east" ]]
			then
			echo "The trees to either side are thick. Perhaps it's best not to go that way"
		elif [[ $2 == "north" ]]
			then
			if [[ numPokemon -gt 0 ]]
				then
				exit 2 #move to Route 1
			else
				echo "Professor Oak: \"Wait a second! It's too dangerous to go alone! There's wild pokemon out there, and you'll need your own pokemon for protection! Take this pokemon to help you!\""
				echo "Congratulations! You recieved a PIKACHU!"
				echo "Professor Oak: \"Perfect! Come talk to me if you have any questions.\""
				echo  -n "PIKACHU" > ./windows/pokemon.txt
			fi
		fi
else
	echo $1
fi