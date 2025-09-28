extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	
	

func _on_death_body_entered(body: Node2D) -> void:
	var anim = $AnimatedSprite2D
	if body.is_in_group("player"):
		anim.play("death")
		await get_tree().create_timer(0.5).timeout
		Globalvars.child_gotten = true
		$AnimatedSprite2D.hide()
		$death.hide()
		$run.hide()
		$CollisionShape2D2.hide()
		


func _on_run_body_entered(body: Node2D) -> void:
	var player: Node2D = null
	velocity = Vector2.ZERO
	# var posistion = $AnimatedSprite2D.position
	if player:
		velocity += (global_position - player.global_position ).normalized()*SPEED
	$AnimatedSprite2D.play("walk")
	move_and_slide()
	
	
