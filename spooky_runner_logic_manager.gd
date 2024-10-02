extends Node
@export var obstacle_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$ObstacleTimer.start()
	var player_spawn_location = $PlayerSpawn.position
	var monster_spawn_location = $MonsterSpawn.position
	$Player.position = player_spawn_location
	$monster.position = monster_spawn_location

func _on_obstacle_timer_timeout():
	var obstacle_set = randi_range(1,2)
	_create_obstacle(obstacle_set)
	$ObstacleTimer.start()

func _create_obstacle(set_number):
	if set_number == 1:
		var obstacle = obstacle_scene.instantiate()
		var spawn_position = $ObjectSpawn.position
		obstacle.position = spawn_position
		add_child(obstacle)
	if set_number == 2:
		var first_obstacle = obstacle_scene.instantiate()
		var first_spawn_position = $ObjectSpawn.position
		first_obstacle.position = first_spawn_position
		
		var second_obstacle = obstacle_scene.instantiate()
		var second_spawn_position = Vector2(first_spawn_position.x-50,first_spawn_position.y)
		second_obstacle.position = second_spawn_position
		
		add_child(first_obstacle)
		add_child(second_obstacle)
	print(set_number)
