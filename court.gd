extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	var cells = get_used_cells(0)
	for cell in cells:
		var tile_data = get_cell_tile_data(0, cell)
		var mod = tile_data.modulate
		print(cell)
		print(mod)


