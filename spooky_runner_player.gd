extends CharacterBody2D

@export var jump_velocity = -300.0
@export var max_character_gravity = 1550.0
@export var character_gravity = 900.0

var current_character_gravity = 0.0

func _physics_process(delta):
		# Add the gravity.
	if Input.is_action_just_pressed("Jump"):
		print(is_on_floor())
		if is_on_floor():
			velocity.y = jump_velocity
	if not is_on_floor():
		if current_character_gravity < max_character_gravity:
			current_character_gravity += character_gravity * delta
			velocity.y += current_character_gravity * delta
	else:
		current_character_gravity = 0.0
	move_and_slide()
