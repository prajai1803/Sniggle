extends Area2D


onready var label = $Label

func _physics_process(delta):
	position.y -= 250 * delta



func _on_Meter_area_entered(area):
	if area.name == "Endline":
		queue_free()

func update_label(value):
	label.text = str(value)


func _on_Meter_body_entered(body):
	if body.name == "Snake":
		Engine.time_scale += 0.025
		if body.has_method("get_score"):
			body.get_score()



