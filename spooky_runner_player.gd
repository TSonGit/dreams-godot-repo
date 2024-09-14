extends Area2D

@export var FALL_SPEED = 100.0
const FLOOR_POSITION = 215.0
var falling = false


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(60,215)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y < FLOOR_POSITION && falling == true:
		position.y += FALL_SPEED
	elif position.y > FLOOR_POSITION && falling == true:
		position.y = FLOOR_POSITION
