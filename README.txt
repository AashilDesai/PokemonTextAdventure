Name: Aashil Desai

Overview:
This is a text-based adventure game modeled after Pokemon Red/Blue. The player starts in Pallet Town and the goal is to obtain the first Gym Badge from Brock (the Pewter City Gym Leader). The player interacts with the game by typing commands in the following format: <instruction> <arg> (note that <arg> is optional and not definied for all instructions).

Valid Instructions:
	inventory
		This command is always valid, and pulls up the current inventory, which contains all the items the player has found to date.
	pokemon
		This command is always valid and pulls up a list of all the pokemon caught by the player.
	exit
		closes the inventory or pokemon windows
	look
		Gives a general overview of where the player currently is (i.e. the player looks around their current location)
	go <direction>
		Moves the player in a marticular cardinal direction (North, South, East, or West).
		If the player is not permitted to move in a certain direction, they will be notified.
	inspect <object>
		If you are currently in the inventory or pokemon windows, gives a description of the pokemon/item
		Else if <object> is a person, this command is the same as "talk to <person>"
		Else if <object> is a pokemon, this command is the same as "catch <pokemon>"
		Else if <object> is either "wildgrass" or "wild grass", this command is the same as "enter wildgrass"
		Else, this command returns the discription of an object
	talk to <person>
		Engages the person in dialog
	catch <pokemon>
		If the player has pokeballs, this will catch the pokemon. 
	enter wildgrass
		The same as "enter wild grass"
	enter wild grass
		Lets the player enter wild grass

Implementation:
This program is written as a collection of files and bash scripts. To run it, please run the script "adventure.sh"

Each file (besides adventure.sh and README.txt) refers to a specific location. When the player is in a particular location, adventure.sh passes the player's input into each of the locations, as well as a list of the player's current inventory and pokemon.

When a particular script runs (like for example "pallet_town.sh inventory pokemon SOME_COMMAD"), it returns an integer from 0-7, which tells adventure.sh how to behave.
	0 indicates that the player is in the same location.
	1-6 indicates that the player should move to a particular location indicated by the number
	7 indicates that the player has won the game
	Any other value is an error