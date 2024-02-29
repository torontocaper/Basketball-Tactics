extends Node2D

@onready var court = $Environment/Court
@onready var players_node = $TurnManager/Players
@onready var turn_manager = $TurnManager

var players : Array

func _ready():
	turn_manager.round_over.connect(_on_round_over)
	players = players_node.get_children()
	_print_locations()

func _on_round_over(round_number):
	print("round " + str(round_number) + " is over.")
	_print_locations()

func _print_locations():
	for player in players:
		var map_position = Vector2(court.local_to_map(player.position))
		var distance_to_origin = map_position.distance_to(Vector2.ZERO)
		print(player.character_name + " is at " + str(player.position) + ", which is " + str(map_position) + " in map space.")
		print("(That's approximately " + str(round(distance_to_origin)) + " away from the origin.)")
		
		
