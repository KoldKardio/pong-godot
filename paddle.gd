extends Area2D

export var left = true # true is paddle.

var up
var down
var speed = 200
var ball_dir

onready var _screen_size_y = get_viewport_rect().size.y
var wallHeight = 25

func _ready():
	if left:
		up = "up_l"
		down = "down_l"
		ball_dir = 1
	else:
		up = "up_r"
		down = "down_r"
		ball_dir = -1

func _physics_process(delta):
	var move = int(Input.is_action_pressed(down)) - int(Input.is_action_pressed(up))
	var vel = speed * Vector2(0, move) * delta
	position.y = clamp(position.y + move * speed * delta, wallHeight, _screen_size_y - wallHeight)


func _on_leftpad_area_entered(area):
	if area.name == "ball":
		print("body entered")
		area.direction = Vector2(ball_dir, randf() * 2 - 1).normalized()
