extends Sprite

var turn_on = true

func _ready():
	set_as_toplevel(true)
	
	
func _physics_process(delta):
	position.x = lerp(position.x, get_parent().position.x, 0.5)
	position.y = lerp(position.y, get_parent().position.y, 0.5)
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	
	if Input.is_action_pressed("Flashlight") :
		$Light2D.enabled = true
	else:
			$Light2D.enabled = false
	
	

