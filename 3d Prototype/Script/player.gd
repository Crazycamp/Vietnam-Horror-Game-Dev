extends Actor

func playerSetup (pos : Vector3):
	global_transform.origin = pos
	
	
func _physics_process(delta) -> void:
	var direction_ground: = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_backwards") - Input.get_action_strength("move_towards")).normalized()
	if not is_on_floor():
		velocity_y -= gravity * delta
	
	var velocity = Vector3(
		direction_ground.x * speed,
		velocity_y,
		direction_ground.y * speed
	)
	move_and_slide(velocity, FLOOR_NORMAL)

	
