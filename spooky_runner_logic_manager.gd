extends Node
@export var obstacle_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$ObstacleTimer.start()

func _on_obstacle_timer_timeout():
	_create_obstacle()
	$ObstacleTimer.start()

func _create_obstacle():
	var obstacle = obstacle_scene.instantiate()
	add_child(obstacle)
	var obstacle_spawn_location = $ObjectSpawn.position
	obstacle.position = obstacle_spawn_location
