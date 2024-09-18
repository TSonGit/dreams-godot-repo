extends Node
@export var minObstacleSpawnTime = 0.25
@export var maxObstacleSpawnTime = 1.0

@export var obstacle_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	create_obstacle(randf_range(minObstacleSpawnTime,maxObstacleSpawnTime))
	

func create_obstacle(spawn_time):
	print("Timer started.")
	await get_tree().create_timer(spawn_time).timeout
	print("Timer ended.")
