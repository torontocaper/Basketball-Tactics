extends Node2D

@onready var court = $Environment/Court

func _ready():
	print("used rect: " + str(court.get_used_rect()))
	print("used cells: " + str(court.get_used_cells(0)))
	print("used cells by id: " + str(court.get_used_cells_by_id(0)))
