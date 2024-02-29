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

	#for i in len(cells):
		#print(str(i) + " " + str(cells[i]) + " " + str(distances_squared[i]) + " " + str(ratios[i]))
		#_cell = cells[i]
		#_ratio = ratios[i]
	queue_redraw()
		#await get_tree().create_timer(0.1).timeout

func _draw():
	for i in len(cells):
		print(str(i) + " " + str(cells[i]) + " " + " " + str(ratios[i]))
		_cell = cells[i]
		_ratio = ratios[i]
		print("drawing a circle at " + str(map_to_local(_cell)))
		draw_circle(map_to_local(_cell), 10, Color.WHITE.darkened(_ratio))
