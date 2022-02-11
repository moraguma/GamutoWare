extends KinematicBody2D


const ACCEL = 0.09
const MAX_SPEED = 120


var velocity = Vector2(0, 0)
var alive = true


onready var parent = get_parent()
onready var nav = $Nav
onready var deerskull = $Deerskull
onready var animation_player = $AnimationPlayer
onready var hit_sound = $HitSound


func _ready():
	animation_player.play("idle")


func _physics_process(delta):
	if alive:
		velocity = move_and_slide(velocity.linear_interpolate(get_input_dir() * MAX_SPEED, ACCEL))


func get_input_dir():
	return Vector2(Input.get_action_strength("direita") - Input.get_action_strength("esquerda"), Input.get_action_strength("baixo") - Input.get_action_strength("cima")).normalized()


func die():
	alive = false
	
	nav.drop()
	deerskull.drop()
	parent.lose()
	
	hit_sound.play()
