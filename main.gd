extends Node2D

@onready var court = $Environment/Court
@onready var players_node = $TurnManager/Players
@onready var turn_manager = $TurnManager

var players : Array

func _ready():
	turn_manager.round_over.connect(_on_round_over)
	print("used rect: " + str(court.get_used_rect()))
	print("used cells: " + str(court.get_used_cells(0)))
	print("used cells by id: " + str(court.get_used_cells_by_id(0)))
	players = players_node.get_children()
	_print_locations()

func _on_round_over(round_number):
	print("round " + str(round_number) + " is over.")
	_print_locations()
	
func _print_locations():
	for player in players:
		print(player.character_name + " is at " + str(court.local_to_map(player.position)))
