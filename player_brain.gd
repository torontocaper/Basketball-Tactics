extends Node

# this script is the brain of an ai-powered basketball player
# it should make decisions based on the game situation (time/score) and its own skills
# it's going to be difficult
@onready var player = get_parent()

func activate():
	print("ai player " + player.character_name + " activated!")
	player.movement_buttons_node.modulate = Color.TRANSPARENT
	player.end_turn_button.modulate = Color.TRANSPARENT
