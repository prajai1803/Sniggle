extends Area2D


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position.y -= 250 * delta




func _on_Hole_area_entered(area):
	if area.name == "Endline":
		queue_free()


func _on_Hole_body_entered(body):
	if body.name == "Snake":
		if body.has_method("drop"):
			body.drop()
