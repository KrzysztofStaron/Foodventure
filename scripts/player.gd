extends KinematicBody2D
const speed = 100

var velocity = Vector2.ZERO

func _process(delta):
	var leftJoy := Vector2.ZERO
	leftJoy.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	leftJoy.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	leftJoy = normalizeVector(leftJoy)
	
	#if abs(leftJoy.x) + abs(leftJoy.y) > 1.1:
	#	print("error:", (abs(leftJoy.x) + abs(leftJoy.y)))
	
	velocity = leftJoy * speed
	move_and_slide(velocity)

func normalizeVector(vector, maxValue = 1):
	var sum = abs(vector.x) + abs(vector.y)
	var dif = sum - maxValue
	if sum <= maxValue or vector == Vector2.ZERO:
		return vector
		
	# normalize
	var value := Vector2.ZERO
	
	# change x value
	if vector.x < 0:
		value.x = vector.x + dif / 2
	else:
		value.x = vector.x - dif / 2
		
	# change y value
	if vector.y < 0:
		value.y = vector.y + dif / 2
	else:
		value.y = vector.y - dif / 2
	
	return value

func hurt():
	pass
