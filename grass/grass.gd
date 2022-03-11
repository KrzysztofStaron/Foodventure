extends TileMap

export var start : Vector2
export var end : Vector2

func _ready() -> void:
	clear()
	end += Vector2(1, 1)
	var noise := OpenSimplexNoise.new()
	noise.seed = randi()
	noise.period = 1
	noise.octaves = 1

	var rng := RandomNumberGenerator.new()
	rng.randomize()
	
	var width := abs(start.x - end.x)
	var height := abs(start.y - end.y)

	for x in width:
		for y in height:
			if noise.get_noise_2d(x, y) > 0.15:
				set_cell(start.x + x, start.y + y, rng.randi_range(0, 5))
			else:
				set_cell(start.x + x, start.y + y, 0)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		end -= Vector2(1, 1)
		_ready()