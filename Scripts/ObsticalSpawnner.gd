extends Node2D


var Hole = preload("res://Sences/Enviroments/Hole.tscn")
var Box = preload("res://Sences/Enviroments/Box.tscn")
onready var timer = $Timer
var n = 0
func _ready():
	pass


func spawn_hole():
	var hole = Hole.instance()
	add_child(hole)
	hole.position.x = rand_range(60,300)

func spawn_box():
	var box = Box.instance()
	add_child(box)
	box.position.x = rand_range(100,300)
	
func timer_start():
	timer.start()

func timer_stop():
	timer.stop()


func _on_Timer_timeout():
	n = rand_range(0,20)
	if n > 10:
		spawn_box()
	else:
		spawn_hole()
