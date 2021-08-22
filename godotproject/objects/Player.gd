extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 250
var control = Vector2(0,0)

#input for player movement
func _control_player():
	control = Vector2()
	if Input.is_action_pressed("move_down"):
		control.y += 1
	if Input.is_action_pressed("move_up"):
		control.y -= 1
	if Input.is_action_pressed("move_left"):
		control.x -= 1
	if Input.is_action_pressed("move_right"):
		control.x += 1
		
	control = control.normalized()
	
	move_and_slide(control * speed)
	look_at(get_global_mouse_position())

func _ready():
	look_at(get_global_mouse_position())
	pass


func _physics_process(delta):
	_control_player()
	pass
	





