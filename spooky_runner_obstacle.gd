extends Area2D
@export var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(260,180)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
