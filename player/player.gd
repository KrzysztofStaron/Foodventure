extends KinematicBody2D

export var speed : int = 40

func _process(_delta):
	var dir : Vector2 = input_manager.vector("move_left", "move_right", "move_up", "move_down")
	move_and_slide(dir * speed)

