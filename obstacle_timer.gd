extends Timer
@export var minObstacleSpawnTime = 3.0
@export var maxObstacleSpawnTime = 7.0

# Called when the node enters the scene tree for the first time.
func _ready():
	_randomize_wait_time()

func _on_timeout():
	_randomize_wait_time()

func _randomize_wait_time():
	wait_time = randf_range(minObstacleSpawnTime,maxObstacleSpawnTime)
