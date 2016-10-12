#!/bin/bash

inventoryFile='./data/inventory.txt'
pokemonFile='./data/pokemon.txt'

#At the start of the game, we wish to empty the player's inventory and pokemon

>$inventoryFile
>$pokemonFile


currentLocation='pallet_town' #we start in pallet town
gameInProgress=true
playerWin=false

echo "Welcome to the wonderful world of Pokémon!"
echo "Now that you are 10 years old, you must set off on your own pokémon journey and try to collect as many badges as possible."

while $gameInProgress #until we have reached a "player wins" state
do
	bash "./locations/${currentLocation}.sh" "intro"
	echo "What do you want to do?"
	read instruction arg
	echo ""

	case $instruction in
		inventory) echo "Your Inventory:"
				cat $inventoryFile ;;
		pokemon) echo "Your Pokemon:"
				cat $pokemonFile ;;
		forfeit) gameInProgress=false ;;
		*) bash "./locations/${currentLocation}.sh" $instruction $arg
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
				*) echo "ERROR - One of the locations outputted an incorrect value" #this should never happen
					gameInProgress=false ;;
			esac
				;;
	esac

	echo ""
done

if $playerWin
	then
	echo "CONGRATULATIONS! You have beaten the game!"
else
	echo "GAME OVER"
fi