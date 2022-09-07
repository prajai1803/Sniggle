extends RigidBody2D

export var SPEED = 5000
signal game_over
signal energy_increase
signal score
var game_over = false


onready var dirt = $Dirt
onready var anim = $AnimationPlayer
onready var anim_player = $AnimationTree.get("parameters/playback")
func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		linear_velocity.x = SPEED * delta
		$CollisionShape2D.rotation_degrees = -30
		anim_player.travel("right")
	elif Input.is_action_pressed("Left"):
		linear_velocity.x = -SPEED * delta
		$CollisionShape2D.rotation_degrees = 30
		anim_player.travel("left")
	else:
		linear_velocity.x = 0 * delta
		anim_player.travel("idle")
		$CollisionShape2D.rotation_degrees = 0

func drop():
	dirt.emitting = false
	linear_velocity.x = 0
	emit_signal("game_over")
	anim.play("drop")
	set_physics_process(false)
	$Drop.play()


func die():
	dirt.emitting = false
	linear_velocity.x = 0
	emit_signal("game_over")
	game_over = true
	set_physics_process(false)
	$Die.play()

func energy_increase(value):
	emit_signal("energy_increase",value)

func get_score():
	emit_signal("score")

