extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -550.0
@onready var current_dir = "none"
@onready var child_gotten = Globalvars.child_gotten

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	play_anim(current_dir)
	

func play_anim(dir):
	
	var child_gotten = Globalvars.child_gotten
	
	var anim = $AnimatedSprite2D
	
	if child_gotten == false:
		if Input.is_action_pressed("left"):
			anim.flip_h = true
			anim.play("left-walk")
		elif Input.is_action_pressed("right"):
			anim.flip_h = false
			anim.play("left-walk")
		else:
			anim.play("left-idle")
			
	elif child_gotten == true:
		if Input.is_action_pressed("left"):
			anim.flip_h = true
			anim.play("pot-run")
		elif Input.is_action_pressed("right"):
			anim.flip_h = false
			anim.play("pot-run")
		else:
			anim.play("pot")
