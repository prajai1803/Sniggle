extends CanvasLayer

signal energy_end
signal restart

onready var energy_progress = $TextureProgress
onready var tween = $Tween
onready var timer = $Timer

func energy_reduce(value):
	var temp = energy_progress.value
	energy_progress.value -= value
	tween.interpolate_property(energy_progress,"value",temp,energy_progress.value,0.01,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	if energy_progress.value ==0:
		emit_signal("energy_end")
		$AudioStreamPlayer.play()

func energy_increase(value):
	var temp = energy_progress.value
	energy_progress.value += value
	tween.interpolate_property(energy_progress,"value",temp,energy_progress.value,0.01,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()

func timer_stop():
	timer.stop()

func _on_Timer_timeout():
	energy_reduce(4)


func _on_Restart_pressed():
	emit_signal("restart")
