extends Node2D


var Meter = preload("res://Sences/Enviroments/Meter.tscn")
onready var timer = $Timer
var count = 0

func _ready():
	pass

func meter_spawnner():
	var meter = Meter.instance()
	count = count +10
	add_child(meter)
	meter.position.x = 180
	meter.update_label(count)


func timer_stop():
	timer.stop()

func timer_start():
	timer.start()


func _on_Timer_timeout():
	meter_spawnner()
