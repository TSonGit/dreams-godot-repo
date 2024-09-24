extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Obstacle created")
	set_linear_velocity(Vector2(-500.0,0.0))
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Obstacle destroyed")
	queue_free()
	
func _on_body_entered():
	queue_free()
