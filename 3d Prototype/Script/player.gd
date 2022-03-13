extends Actor

onready var sprint_timer = $SprintTimer
var sprinting = false
var a = 0
var current_animation = "idle"

func playerSetup (pos : Vector3):
	global_transform.origin = pos
	
	
func _physics_process(delta) -> void:
	speed = normal_speed
	var direction_ground: = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_backwards") - Input.get_action_strength("move_towards")).normalized()
		
	if Input.is_action_pressed("move_right"):
		current_animation = "idle"
	if Input.is_action_pressed("move_left"):
		current_animation = "idle"
	if Input.is_action_pressed("move_backwards"):
		current_animation = "idle"
	if Input.is_action_pressed("move_towards"):
		current_animation = "idle"
	
	if direction_ground.length() != 0:
		a = direction_ground.angle() / (PI/4)
		a = wrapi(int(a), 0, 8)
		current_animation = "run"
	
	if Input.is_action_pressed("sprint"):
		sprint_timer.start()
		sprinting = true 
		speed = sprint_speed
	
	if sprinting:
		speed = sprint_speed
		
	
	if not is_on_floor():
		velocity_y -= gravity * delta
	
	var velocity = Vector3(
		direction_ground.x * speed,
		velocity_y,
		direction_ground.y * speed
	)
	move_and_slide(velocity, FLOOR_NORMAL)
	
#	# If the code cannot run, please delete the line below then insert it back
#	# Currently we still don't have AnimatedSprite yet so the line below cannot executed
#	$AnimatedSprite.animation = current_animation + str(a)

		
func _on_SprintTimer_timeout() -> void:
	sprinting = false
