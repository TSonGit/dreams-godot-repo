extends ProgressBar
@export var monster: PackedScene



func update():
	value = value - (max_value/10)
	if value == 0:
		get_tree().quit()
	


# Called when the node enters the scene tree for the first time.
func _ready():
	#monster.healthChange.connect(update)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_monster_health_change():
	update()
