extends KinematicBody2D

var velocity = Vector2(0,0)
export var speed = 250

var control = Vector2(0,0)

## bullet stuff
export var bullet_speed = 1000
export var fire_rate = 0.2
var bullet = preload("res://objects/bullet.tscn")
var canshoot= true



#input for player movement
func control_player():
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
	
	if Input.is_action_pressed("fire") and canshoot:
		shoot()
		canshoot = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		canshoot = true

func shoot():
	var bullet_instance = bullet.instance()
	bullet_instance.position = $firePoint.get_global_position()
	bullet_instance.position.x = bullet_instance.position.x
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().add_child(bullet_instance)
	
	



func _ready():
	look_at(get_global_mouse_position())
	pass


func _physics_process(delta):
	control_player()
	pass
	





