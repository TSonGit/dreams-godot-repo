extends CharacterBody2D

signal obstacle_hit

@export var jump_velocity:float = 0.0
@export var max_character_gravity = 1550.0
@export var character_gravity = 900.0
@export var maxLife = 3
@export var jumpCount:int = 0

var currentLife
var hitStunned
var holdingDynamite

var current_character_gravity = 0.0
var jumpTimer:float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	currentLife = maxLife
	holdingDynamite = false
	$AnimatedSprite2D.play("run")

func _process(delta):
	if holdingDynamite:
		$AnimatedSprite2D.play("run_dynamite")
	else:
		$AnimatedSprite2D.play("run")
		
	if (Input.is_action_pressed("Throw")):
		holdingDynamite = false

func _physics_process(delta):
	# Add the gravity.
	jumpTimer += delta
	
	if (Input.is_action_just_pressed("Jump")):
		if is_on_floor():
			jump_velocity -= 600
			velocity.y = jump_velocity
		else:
			jumpTimer = 0.25
	else: if (Input.is_action_pressed("Jump")):
		if (!is_on_floor()):
			if jumpTimer < 0.25:
				jump_velocity -= 900 * delta
				velocity.y = jump_velocity

# Reset jump
	if (!Input.is_action_pressed("Jump") && is_on_floor()):
		jumpTimer = 0.0
		jump_velocity = 0.0

# Something to do with gravity
	if(!is_on_floor()):
		velocity.y += 40

	move_and_slide()


func _on_area_2d_area_entered(area):
	if (area.name == "ObstacleArea"):
		currentLife -= 1
		area.get_parent().queue_free()
		print("Obstacle Destroyed by Player")
		if currentLife >= 0:
			pass
	if (area.name == "DynamiteArea") && not holdingDynamite:
		holdingDynamite = true
		area.get_parent().queue_free()
		print("Player grabbed dynamite")
