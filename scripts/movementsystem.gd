extends CharacterBody2D

const ROLL_SPEED = 200.0
const SPEED = 100.0
const JUMP_VELOCITY = -200.0
var is_rolling: bool = false
var roll_cooldown: bool = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("Jump") and is_on_floor():
		if is_rolling == false:
			velocity.y = JUMP_VELOCITY
		


	var direction := Input.get_axis("Left", "Right")
	if direction:
		if is_rolling == false:
			velocity.x = direction * SPEED
			$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
		
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
		
	if Input.is_action_just_pressed("Dash") and is_on_floor():
		is_rolling = true
		velocity.x = direction * ROLL_SPEED
		$AnimatedSprite2D.play("dash")
		
		await get_tree().create_timer(0.5).timeout
		is_rolling = false
		
		if is_rolling == false:
			if velocity.x >= 100:
				$AnimatedSprite2D.stop()
				$AnimatedSprite2D.play("run")
			elif velocity.x <= 0:
				$AnimatedSprite2D.play("idle")
		

	move_and_slide()
	
	
