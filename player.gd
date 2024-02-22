extends CharacterBody2D

class_name Player

@onready var player_camera = $PlayerCamera
@onready var player_sprite = $PlayerSprite
@onready var player_ui = $PlayerUI
@onready var name_label = $PlayerUI/CenterContainer/VBoxContainer/NameLabel
@onready var movement_buttons = $PlayerUI/CenterContainer/VBoxContainer/MovementButtons

@export var character_name : String = "Blorb"
@export var movement_speed = 3

var tile_size := Vector2i(16, 16)
var is_turn := false
var movement_cost : float
var movement_remaining = movement_speed

signal turn_finished

func _ready():
	name_label.text = character_name
	movement_buttons = movement_buttons.get_child(0).button_group
	movement_buttons.pressed.connect(_on_button_group_pressed)

func _execute_turn(player):
	if player == self:
		is_turn = true
		print("it's " + character_name + "'s turn")
		if player_camera.is_current() == false:
			player_camera.make_current()
		player_sprite.play("idle")
		player_ui.visible = true
	else:
		is_turn = false

func _on_end_turn_button_pressed():
	player_ui.visible = false
	player_sprite.stop()
	turn_finished.emit()
	movement_remaining = movement_speed
	is_turn = false

func _on_button_group_pressed(button):
	var button_name = button.name 
	print(str(button_name) + " pressed")
	var movement_vector : Vector2i
	if button_name == "Up":
		movement_vector = Vector2i.UP * tile_size
	if button_name == "Left":
		movement_vector = Vector2i.LEFT * tile_size
	if button_name == "Right":
		movement_vector = Vector2i.RIGHT * tile_size
	if button_name == "Down":
		movement_vector = Vector2i.DOWN * tile_size
	if button_name == "Up-Left":
		movement_vector = (Vector2i.UP + Vector2i.LEFT) * tile_size
	if button_name == "Up-Right":
		movement_vector = (Vector2i.UP + Vector2i.RIGHT) * tile_size
	if button_name == "Down-Left":
		movement_vector = (Vector2i.DOWN + Vector2i.LEFT) * tile_size
	if button_name == "Down-Right":
		movement_vector = (Vector2i.DOWN + Vector2i.RIGHT) * tile_size
	
	if movement_vector.length_squared() > tile_size.x * tile_size.y:
		movement_cost = 1.5
	else:
		movement_cost = 1
	
	if movement_remaining >= movement_cost:
		translate(movement_vector)
		movement_remaining -= movement_cost
	else:
		print("not enough movement points left")
