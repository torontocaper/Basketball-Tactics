extends TileMap

var cells_i : Array[Vector2i]
	
func _ready():
	cells_i = get_used_cells(0)
	for cell_i in cells_i:
		# var coords = Vector2(cell_i)
		# var d_squared = coords.distance_squared_to(Vector2.ZERO)
		var local_coords = map_to_local(cell_i)
		draw_circle(local_coords, 8, Color.BLACK)
