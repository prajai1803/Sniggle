extends Control


func _ready():
	yield(get_tree().create_timer(3),"timeout")
	$Tween.interpolate_property($Button,"modulate:a",0,1,1,Tween.TRANS_BACK,Tween.EASE_IN)
	$Tween.start()


func _on_Button_pressed():
	get_tree().change_scene("res://Sences/Menu.tscn")
