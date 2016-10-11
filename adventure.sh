#!/bin/bash

inventoryFile='./windows/inventory.txt'
pokemonFile='./windows/pokemon.txt'

#At the start of the game, we wish to empty the player's inventory and pokemon

>$inventoryFile
>$pokemonFile

currentLocation='pallet_town' #we start in pallet town
gameInProgress=true
playerWin=false

echo "Welcome to the wonderful world of Pokémon!"
echo "Now that you are now 10, you must set off on your own pokémon journey and try to collect as many badges as possible."

while $gameInProgress #until we have reached a "player wins" state
do
	bash "./locations/${currentLocation}.sh" "intro"
	echo "What do you want to do?"
	read instruction

	case $instruction in
		inventory) echo "Your Inventory:"
				cat $inventoryFile | echo ;;
		pokemon) echo "Your Pokemon:"
				cat $pokemonFile | echo ;;
		forfeit) gameInProgress=false ;;
		*) bash "./locations/${currentLocation}.sh" $instruction 
			case $? in 
				0) ;; #do nothing, since we changed nothing
				1) currentLocation="pallet_town" ;;
				2) currentLocation="route_1" ;;
				3) currentLocation="viridian_city" ;;
				4) currentLocation="route_22" ;;
				5) currentLocation="viridian_forest";;
				6) currentLocation="pewter_city" ;;
				7) gameInProgress=false
					playerWin=true ;;
				*) exit 1 #this should never happen
			esac
				;;
	esac
done

if $playerWin
	then
	echo "Congrats for winning!"
else
	echo "You lose!"
fi