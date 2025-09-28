extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$child.hide()
	Globalvars.child_gotten = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_sacrifice_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globalvars.child_gotten = false
		$child.show()
		$child/child/AnimatedSprite2D.play("death")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/you_win.tscn")
