extends TileMap

export var start : Vector2
export var end : Vector2

func _ready():
	for x in abs(start.x - end.x):
		for y in abs(start.x - end.x):
			set_cell(start.x + x, start.y + y, 0)
