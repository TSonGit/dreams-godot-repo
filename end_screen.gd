extends CanvasLayer

func _show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func _show_game_won():
	_show_message("Game Over\n You Win!")
	await $MessageTimer.timeout
	get_tree().quit()

func _show_game_lost():
	_show_message("Game Over\n You Lose!")
	await $MessageTimer.timeout
	get_tree().quit()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_node_game_over():
	_show_game_lost()


func _on_node_game_won():
	_show_game_won()
