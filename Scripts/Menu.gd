extends Control


func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Sences/World.tscn")



func _on_HowToPlay_pressed():
	get_tree().change_scene("res://Sences/Enviroments/HowToPlay.tscn")
