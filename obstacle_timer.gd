extends Timer
@export var minObstacleSpawnTime = 2.0
@export var maxObstacleSpawnTime = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	_randomize_wait_time()

func _on_timeout():
	_randomize_wait_time()

func _randomize_wait_time():
	wait_time = randf_range(minObstacleSpawnTime,maxObstacleSpawnTime)
