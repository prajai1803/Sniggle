extends Area2D




func _physics_process(delta):
	position.y -= 250 * delta




func _on_EnergyBall_body_entered(body):
	if body.name == "Snake":
		$AudioStreamPlayer.play()
		$Blast.emitting = true
		$Sprite.hide()
		if body.has_method("energy_increase"):
			body.energy_increase(30)
		yield($AudioStreamPlayer,"finished")
		queue_free()
		


func _on_EnergyBall_area_entered(area):
	if area.name == "EndLine":
		queue_free()
