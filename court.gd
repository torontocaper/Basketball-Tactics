extends TileMap

var _cell : Vector2i
var _ratio : float
var cells : Array[Vector2i]
var ratios : Array

func _ready():
	var distances_squared : Array[float] = []
	cells = get_used_cells(0)

	for cell in cells:
		var distance_squared_to_origin = Vector2(cell).distance_squared_to(Vector2.ZERO)
		distances_squared.append(distance_squared_to_origin)

	var max_distance = distances_squared.max()
	ratios = distances_squared.map(func(number): return number/max_distance)
	
	queue_redraw()
	
	
func _draw():
	for i in len(cells):
		print(str(i) + " " + str(cells[i]) + " " + " " + str(ratios[i]))
		_cell = cells[i]
		_ratio = ratios[i]
		var position_of_rect = map_to_local(_cell) - Vector2(8, 8)
		print("drawing a rect at " + str(position_of_rect))
		draw_rect(Rect2(position_of_rect, Vector2(16, 16)), Color.WHITE.darkened(_ratio))
		
