extends Node

@onready var players = $Players.get_children()

var round_number := 1

signal your_turn(player)

func _ready():
	players.shuffle()
	for player in players:
		connect("your_turn", player._execute_turn)
	_execute_round()

func _execute_round():
	print("it's round " + str(round_number))
	for player in players:
		print("sending 'your turn' signal to " + player.character_name)
		your_turn.emit(player)
		await player.turn_finished
	round_number += 1
	_execute_round()

