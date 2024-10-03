extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Obstacle created")
	set_linear_velocity(Vector2(-450.0,0.0))
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	_destroy()
	
func _on_body_entered(_body):
	if _body.name == "Player":
		_destroy()

func _destroy():
	print("Obstacle destroyed")
	queue_free()
