extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Dynamite created")
	set_linear_velocity(Vector2(-450.0,0.0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
