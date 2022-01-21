tool
extends Area


export var next_room: PackedScene

func _input(event: InputEvent):
	if event.is_action_pressed("interact"):
		teleport()

func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_room else ""


func teleport() -> void:
	get_tree().change_scene_to(next_room)
