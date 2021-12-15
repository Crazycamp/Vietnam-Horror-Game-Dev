extends Light2D



func _process(delta):
	position += (Vector2.RIGHT).rotated(rotation) * delta


