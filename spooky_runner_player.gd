extends CharacterBody2D

@export var jump_velocity:float = 0.0
@export var max_character_gravity = 1550.0
@export var character_gravity = 900.0
@export var life = 3
@export var jumpCount:int = 0

var current_character_gravity = 0.0
var jumpTimer:float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta):
		# Add the gravity.
	#jumpTimer += delta
	#
	#if (Input.is_action_just_pressed("Jump")):
		#if is_on_floor():
			#jump_velocity -= 600
			#velocity.y = jump_velocity
		##else:
			##jumpTimer = 0.0
	#else: if (Input.is_action_pressed("Jump")):
		#if (!is_on_floor()):
			#if jumpTimer < 0.25:
				#jump_velocity -= 900
				#velocity.y = jump_velocity
				
	
 #If jump is just pressed: 
	if (Input.is_action_just_pressed("Jump") && is_on_floor()):
		jump_velocity -= 600
		velocity.y = jump_velocity
# If jump is pressed/held:
	if (Input.is_action_pressed("Jump") && is_on_floor()):
		if jumpTimer < 0.25:
			jumpTimer += delta
			velocity.y = jump_velocity
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			velocity.y = jump_velocity
			jumpTimer += delta 
# Reset jump
	if (!Input.is_action_pressed("Jump") && is_on_floor()):
		jumpTimer = 0.0
		jump_velocity = 0.0
# Something to do with gravity
	if(!is_on_floor()):
		velocity.y += 40
	#if not is_on_floor():
		#if current_character_gravity < max_character_gravity:
			#current_character_gravity += character_gravity * delta
			#velocity.y += current_character_gravity * delta
	#else:
		#current_character_gravity = 0.0
	move_and_slide()
