extends Timer
@export var minDynamiteSpawnTime = 3.0
@export var maxDynamiteSpawnTime = 8.0

# Called when the node enters the scene tree for the first time.
func _ready():
	_randomize_wait_time()

func _on_timeout():
	_randomize_wait_time()

func _randomize_wait_time():
	wait_time = randf_range(minDynamiteSpawnTime,maxDynamiteSpawnTime)
