extends Area

export(NodePath) var teleport_target = null

var player_in_door = false

func _process(delta: float):
	if Input.is_action_just_pressed("interact") and player_in_door == true:
		get_tree().call_group("Player", "teleport_to", get_node(teleport_target).position)

func _on_Door_body_entered(body: Node):
	player_in_door = true


func _on_Door_body_exited(body: Node):
	player_in_door = false
