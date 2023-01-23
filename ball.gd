extends Area2D

const DEF_SPEED = 100

var speed = DEF_SPEED
var direction = Vector2.LEFT
var bounce_dir = 1

onready var init_position = position

func _process(delta):
	print(global_position)
	speed += delta * 2
	position += speed * delta * direction
	
	if global_position.y > 390:
		direction.y *= -1
	if global_position.y < 10:
		direction.y *= -1

# init_collision reset function
func reset():
	direction = Vector2.LEFT
	position = init_position
	speed = DEF_SPEED
	

func _on_leftWall_area_entered(area):
	if area.name == "ball":
		area.reset()
	pass # Replace with function body.

func _on_rightWall_area_entered(area):
	if area.name == "ball":
		area.reset()
	pass # Replace with function body.

# end_collision reset function

