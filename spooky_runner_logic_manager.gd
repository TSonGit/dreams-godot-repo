extends Node
@export var obstacle_scene: PackedScene
@export var dynamite_scene: PackedScene

var last_set = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$ObstacleTimer.start()
	$DynamiteTimer.start()
	var player_spawn_location = $PlayerSpawn.position
	var monster_spawn_location = $MonsterSpawn.position
	$Player.position = player_spawn_location
	$monster.position = monster_spawn_location

func _on_obstacle_timer_timeout():
	var obstacle_set = randi_range(1,6)

	while obstacle_set == last_set:
		obstacle_set = randi_range(1,6)
	_create_obstacle(obstacle_set)
	last_set = obstacle_set
	

	$ObstacleTimer.start()

func _create_obstacle(set_number):
	if set_number == 1: #Single Obstacle on Floor
		var obstacle = obstacle_scene.instantiate()
		var spawn_position = $BottomObjectSpawn.position
		obstacle.position = spawn_position
		add_child(obstacle)
	if set_number == 2: #Double obstacle on Floor
		var first_obstacle = obstacle_scene.instantiate()
		var first_spawn_position = $BottomObjectSpawn.position
		first_obstacle.position = first_spawn_position
		
		var second_obstacle = obstacle_scene.instantiate()
		var second_spawn_position = Vector2(first_spawn_position.x-75,first_spawn_position.y)
		second_obstacle.position = second_spawn_position
		
		add_child(first_obstacle)
		add_child(second_obstacle)
	if set_number == 3: #Single obstacle on ceiling
		var obstacle = obstacle_scene.instantiate()
		var obstacle_orientation = 3.14159
		var spawn_position = $TopObjectSpawn.position
		obstacle.rotate(obstacle_orientation) #Rotate() works in Radians. Convert radians to degrees.
		obstacle.position = spawn_position
		add_child(obstacle)
	if set_number == 4: #Double obstacle on ceiling
		var first_obstacle = obstacle_scene.instantiate()
		var obstacle_orientation = 3.14159
		var first_spawn_position = $TopObjectSpawn.position
		first_obstacle.rotate(obstacle_orientation)
		first_obstacle.position = first_spawn_position
		
		var second_obstacle = obstacle_scene.instantiate()
		var second_spawn_position = Vector2(first_spawn_position.x-75,first_spawn_position.y)
		second_obstacle.rotate(obstacle_orientation)
		second_obstacle.position = second_spawn_position
		
		add_child(first_obstacle)
		add_child(second_obstacle)
	if set_number == 5: #Double on Floor, Single on ceiling
		var first_obstacle = obstacle_scene.instantiate()
		var first_spawn_position = $BottomObjectSpawn.position
		first_obstacle.position = first_spawn_position
		
		var second_obstacle = obstacle_scene.instantiate()
		var second_spawn_position = Vector2(first_spawn_position.x-75,first_spawn_position.y)
		second_obstacle.position = second_spawn_position
		
		var third_obstacle = obstacle_scene.instantiate()
		var obstacle_orientation = 3.14159
		var third_spawn_position = Vector2(first_spawn_position.x+200, first_spawn_position.y-300)
		third_obstacle.rotate(obstacle_orientation)
		third_obstacle.position = third_spawn_position
		
		add_child(first_obstacle)
		add_child(second_obstacle)
		add_child(third_obstacle)
	if set_number == 6: #Double on ceiling, Single on Floor
		var first_obstacle = obstacle_scene.instantiate()
		var obstacle_orientation = 3.14159
		var first_spawn_position = $TopObjectSpawn.position
		first_obstacle.rotate(obstacle_orientation)
		first_obstacle.position = first_spawn_position
		
		var second_obstacle = obstacle_scene.instantiate()
		var second_spawn_position = Vector2(first_spawn_position.x-75,first_spawn_position.y)
		second_obstacle.rotate(obstacle_orientation)
		second_obstacle.position = second_spawn_position
		
		var third_obstacle = obstacle_scene.instantiate()
		var third_spawn_position = Vector2(first_spawn_position.x+200, first_spawn_position.y+300)
		third_obstacle.position = third_spawn_position
		
		add_child(first_obstacle)
		add_child(second_obstacle)
		add_child(third_obstacle)
	print(set_number)


func _on_dynamite_timer_timeout():
	_create_Dynamite()
	$DynamiteTimer.start()

func _create_Dynamite():
	var dynamite = dynamite_scene.instantiate()
	var dynamite_spawn_location = $DynamiteSpawn.position
	dynamite.position = dynamite_spawn_location
	
	add_child(dynamite)
