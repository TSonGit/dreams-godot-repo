extends Area2D

@export var monsterCurrentHealth:int
@export var monsterMaxHealth:int = 10

signal healthChange

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("puppet")
	monsterCurrentHealth = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass


func _on_area_entered(area):
		if (area.name == "ObstacleArea"):
			area.get_parent().queue_free()
			print("Obstacle Destroyed by Worm")
		if (area.name == "DynamiteArea"):
			area.get_parent().queue_free()
			#damageTaken()
			print("Dynamite Destroyed by Worm")

func damageTaken():
	healthChange.emit()
