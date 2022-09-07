extends Node2D


onready var obstical_spawnner = $ObsticalSpawnner
onready var energy_spawnner = $EnergySpawnner
onready var hud = $HUD
onready var finisher = $FinisherSpawnner
onready var admob = $AdMob
onready var anim_player = $AnimationPlayer
onready var game_over_screen = $HUD/GameOverScreen
onready var dirt = $Snake/Dirt
onready var snake = $Snake
onready var point_label = $HUD/GameOverScreen/VBoxContainer/HBoxContainer/Point

var save_path = "user://highscore.dat"
var score = 0
var energy = 100
var highscore = 0

func _ready():
	Engine.time_scale = 1
	game_start()
	load_ads()
	load_data()
	$HUD/GameOverScreen/VBoxContainer/HBoxContainer2/Point.text = str(highscore)

func load_ads():
	admob.load_banner()
	admob.load_interstitial()
	admob.load_rewarded_video()

func update_score(new_score):
	score = new_score
	if score > 10:
		obstical_spawnner.timer.wait_time = .1
	

func game_start():
	anim_player.play("Start")
	obstical_spawnner.timer_start()
	energy_spawnner.timer_start()
	finisher.timer_start()
	game_over_screen.hide()
	admob.show_banner()
	
	
	

func game_over():
	anim_player.stop()
	get_tree().call_group("obsticle","set_physics_process",false)
	get_tree().call_group("power","set_physics_process",false)
	obstical_spawnner.timer_stop()
	energy_spawnner.timer_stop()
	finisher.timer_stop()
	dirt.emitting = false
	$HUD/Timer.stop()
	snake.set_physics_process(false)
	snake.linear_velocity.x = 0
	$BackGroundMusic.playing = false
	admob.show_interstitial()
	yield(get_tree().create_timer(2),"timeout")
	game_over_screen.show()
	
	if score > highscore:
		highscore = score
		$HUD/GameOverScreen/VBoxContainer/HBoxContainer2/Point.text = str(highscore)
	
	save_data()
	
	

func _on_Snake_game_over():
	game_over()
	


func _on_HUD_energy_end():
	game_over()


func _on_Snake_energy_increase(value):
	hud.energy_increase(value)


func _on_HUD_restart():
	get_tree().reload_current_scene()
	admob.show_banner()


func _on_Snake_score():
	score += 10
	point_label.text = str(score)

func save_data():
	var file = File.new()
	file.open(save_path,file.WRITE)
	file.store_var(highscore)
	file.close()

func load_data():
	var file = File.new()
	if file.file_exists(save_path):
		file.open(save_path,file.READ)
		highscore = file.get_var()
		file.close()

