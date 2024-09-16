extends CharacterBody2D

@export var character_gravity = 15.0
@export var jump_strength = -75.5

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(70,30)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#if is_on_floor():
	if Input.is_action_just_pressed("Jump"):
			velocity.y = jump_strength
	if not is_on_floor():
		if velocity.y <= 0.0:
			velocity.y += gravity * delta
	
