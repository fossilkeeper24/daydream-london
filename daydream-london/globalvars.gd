extends Node

var child_gotten = false
var levelR = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#levelR = which_level()
	print(levelR)
	pass
	
func which_level():
	var level = levelR
	var current_scene = str(get_tree().current_scene)
	if current_scene.contains("starting area"):
		level = 1
	elif current_scene.contains("level2"):
		level = 2
	print("globals: ", current_scene, " ", level)
	return level
