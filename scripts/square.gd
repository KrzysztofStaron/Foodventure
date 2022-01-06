extends enemy

func _ready():
	print(health)

func _process(delta):
	move_and_slide(Vector2(2,1) * 10)
