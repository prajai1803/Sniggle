extends Node2D

var  EnergyBall = preload("res://Sences/Enviroments/EnergyBall.tscn")

onready var timer = get_node("Timer")
func _ready():
	pass # Replace with function body.

func _process(delta):
	timer.wait_time = rand_range(1,10)


func timer_start():
	timer.start()

func spawn_energy():
	var energy_ball = EnergyBall.instance()
	add_child(energy_ball)
	energy_ball.position.x = rand_range(30,320)
	

func _on_Timer_timeout():
	spawn_energy()

func timer_stop():
	timer.stop()
