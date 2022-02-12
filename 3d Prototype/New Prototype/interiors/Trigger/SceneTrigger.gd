extends Spatial

export (String) var path = "res://"

func _ready() -> void:
	pass # Replace with function body.

func _on_Area_body_entered(body: Node) -> void:
	if body is KinematicBody && body.is_in_group("player"):
		pass


func _on_Area_body_exited(body: Node) -> void:
	pass # Replace with function body.
