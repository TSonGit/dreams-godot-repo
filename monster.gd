extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("worm")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass


func _on_area_entered(area):
		if (area.name == "ObstacleArea"):
			area.get_parent().queue_free()
