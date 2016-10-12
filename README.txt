Name: Aashil Desai

Overview:
This is a text-based adventure game modeled after Pokemon Red/Blue. The player starts in Pallet Town and the goal is to obtain the first Gym Badge from Brock (the Pewter City Gym Leader). The player interacts with the game by typing commands in the following format: <instruction> <arg> (note that <arg> is optional and not definied for all instructions).

Valid Instructions:
	inventory
		This command is always valid, and pulls up the current inventory, which contains all the items the player has found to date.
	pokemon
		This command is always valid and pulls up a list of all the pokemon caught by the player.
	look
		Gives a general overview of where the player currently is (i.e. the player looks around their current location)
	go <direction>
		Moves the player in a particular cardinal direction (North, South, East, or West).
		If the player is not permitted to move in a certain direction, they will be notified.
		A player may only move in cardinal direction. (This mimics the original pokemon games).
	talk to <person>
		Engages the person in dialog
	catch <pokemon>
		If the player has pokeballs, this will catch the pokemon. 
	forfeit
		The game ends and the player loses

Implementation:
This program is written as a collection of files and bash scripts. To run it, please run the script "adventure.sh"

Each file (besides adventure.sh and README.txt) refers to a specific location. When the player is in a particular location, adventure.sh passes the player's input into each of the locations. The player's inventory and pokemon are stored in .txt files (in the "data" folder).

When a particular script runs (like for example "pallet_town.sh  SOME_COMMAD"), it returns an integer from 0-7, which tells adventure.sh how to behave.
	0 indicates that the player is in the same location.
	1-6 indicates that the player should move to a particular location indicated by the number
	7 indicates that the player has won the game
	Any other value is an error


Walkthrough:
For the purposes of testing this project, here's the walkthrough. Note that in order to beat Brock, the player must talk to him and have at least 3 pokemon. Including PIKACHU (the player's starting pokemon), there are 4 pokemon in the game, so a player does not have to catch every singler pokemon to win.

In Pallet Town go north. This will prompt Professor Oak to give you PIKACHU (which also happens in Pokemon Red/Blue/Yellow). Now go north twice to reach Viridian City. Talk to the Pokemart Employee. She will give you a PACKAGE and ask you to deliver it back to Professor Oak. Go south twice (back to Pallet Town) and talk to Professor Oak. He will talk your PACKAGE and give you POKEBALLS. Now you can catch a pokemon by going to a route with a Pokemon in it (Route 1, Route 22, and Viridian Forest) and typing "catch <pokemon_name>".

At this point capture any 2 pokemon and (including PIKACHU) you'll now have 3 pokemon. Go north all the way to Pewter City, talk to Brock, and he will give you the Boulder Badge. Congrats! You've beaten the game!

Requirements:
This game meets the requirements set out in the assignment.
	1) At any time the user can use "look" to look around a room. Also note that the output of "look" changes in some routes (the routes with pokemon in them) to reflect a change of state (i.e. the pokemon being caught). 

	2) The player moves by typing "go <direction>" for any of the four cardinal directions. If the player may not proceed a certain way they are informed.

	3) The user has two inventories, "inventory" and "pokemon", both of which must contain certain elements in order to pass certain checkpoints. (The user must have at least 3 pokemon to beat Brock, and the user must have POKEBALLS to catch these pokemon.) Aditionally, the "mini-quest" to get the POKEBALLS involves talking to multipls NPCs and exchanging an intermediary item (the PACKAGE), which serves no purpose but to trade in for the POKEBALLS.

	4) All other possible inputs are specified above in the README, and consist of "<instruction> <args>"

	5) Hopefully this README is detailed enough :)