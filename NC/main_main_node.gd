extends Node



func _ready() -> void:
	#usually start into cinematic if no save game and then start the game
	get_node("Game").start(null)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
