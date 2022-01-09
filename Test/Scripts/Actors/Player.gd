extends Actor

func _physics_process(delta: float) -> void:
	var direction: = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		0.0
		).normalized()
	
	if not is_on_floor():
		_velocity_y -= gravity * delta
	
	var _velocity = Vector3(
		direction.x * speed,
		_velocity_y,
		direction.y * speed)
	move_and_slide(_velocity, FLOOR_NORMAL)
	
	if is_on_floor() or is_on_ceiling():
		_velocity_y = 0.0




