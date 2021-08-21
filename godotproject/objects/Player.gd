extends Node2D


enum PlayerState {IDLETOP, IDLEDOWN, IDLELEFT, IDLERIGHT, WALKINGTOP, WALKINGDOWN,WALKINGLEFT,WALKINGRIGHT}
#onready var anim = get_node("AnimatedSprite")

var moveSpeed = 5

var PlayerStateNames = {
	PlayerState.IDLETOP : "idleTop", 
	PlayerState.IDLEDOWN : "idleDown" , 
	PlayerState.IDLELEFT : "idleLeft", 
	PlayerState.IDLERIGHT : "idleRight", 
	PlayerState.WALKINGTOP : "walkingTop", 
	PlayerState.WALKINGDOWN : "walkingDown",
	PlayerState.WALKINGLEFT : "walkingLeft",
	PlayerState.WALKINGRIGHT : "walkingRight"}


export var player_state = PlayerState.IDLETOP;



func checkControl():
	if(Input.is_action_pressed("ui_up")):
		player_state = PlayerState.WALKINGTOP
		
	if(Input.is_action_just_released("ui_up")):
		player_state = PlayerState.IDLETOP

	if(Input.is_action_pressed("ui_down")):
		player_state = PlayerState.WALKINGDOWN
	
	if(Input.is_action_just_released("ui_down")):
		player_state = PlayerState.IDLEDOWN
	
	if(Input.is_action_pressed("ui_right")):
		player_state = PlayerState.WALKINGRIGHT
	
	if(Input.is_action_just_released("ui_right")):
		player_state = PlayerState.IDLERIGHT
	
	if(Input.is_action_pressed("ui_left")):
		player_state = PlayerState.WALKINGLEFT
	
	if(Input.is_action_just_released("ui_left")):
		player_state = PlayerState.IDLELEFT
	

func movePlayer():
	print("Player is " + PlayerStateNames[player_state])
	if(player_state == PlayerState.WALKINGTOP):
		self.position.y -= moveSpeed
		
	if(player_state == PlayerState.IDLETOP):
		pass
		
	if(player_state == PlayerState.WALKINGDOWN):
		self.position.y += moveSpeed
		
	if(player_state == PlayerState.IDLEDOWN):
		pass
		
	if(player_state == PlayerState.WALKINGRIGHT):
		self.position.x += moveSpeed

	if(player_state == PlayerState.IDLERIGHT):
		pass

	if(player_state == PlayerState.WALKINGLEFT):
		self.position.x -= moveSpeed

	if(player_state == PlayerState.IDLELEFT):
		pass
		



# Called when the node enters the scene tree for the first time.
func _ready():

	
	pass # Replace with function body.



func _process(delta):
	checkControl()
	movePlayer()
	pass
