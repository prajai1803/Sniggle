extends Area2D



func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position.y -= 250 * delta

func _on_Box_area_entered(area):
	if area.name == "EndLine":
		queue_free()


func _on_Box_body_entered(body):
	if body.name == "Snake":
		if body.has_method("die"):
			body.die()
