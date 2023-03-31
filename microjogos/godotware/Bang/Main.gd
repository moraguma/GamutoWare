extends Node2D


signal win
signal lose


const WIDTH = 640
const HEIGHT = 360

const SHOOT_TIME = 0.6
const MIN_WAIT_TIME = 2
const MAX_WAIT_TIME = 5


# Feito por Arthur Lucas da Silva Nogueira
# feat. Henrique Finger Zimerman

var set = false

var status = false

var end = false


@onready var shoot_timer = $ShootTimer
@onready var wait_timer = $WaitTimer
@onready var end_timer = $EndTimer
@onready var animated_sprite = $AnimatedSprite2D

@onready var click = $Click
@onready var music = $Music
@onready var shoot = $Shoot


func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("SE PREPARE...")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("GET READY...")
	
	shoot_timer.set_wait_time(SHOOT_TIME)
	wait_timer.set_wait_time(randf_range(MIN_WAIT_TIME, MAX_WAIT_TIME))
	shoot_timer.connect("timeout",Callable(self,"_on_shoot_timeout"))
	wait_timer.connect("timeout",Callable(self,"_on_wait_timeout"))
	wait_timer.start()
	
	music.play()


func _input(event):
	if (Input.is_action_just_pressed("acao") or Input.is_action_just_pressed("cima") or Input.is_action_just_pressed("direita") or Input.is_action_just_pressed("baixo") or Input.is_action_just_pressed("esquerda")) and not end:
		end = true
		
		wait_timer.stop()
		shoot_timer.stop()
		
		shoot.play()
		
		if set:
			animated_sprite.set_animation("win")
			emit_signal("win")
		else:
			animated_sprite.set_animation("dodge")
			music.stop()


func _on_wait_timeout():
	set = true
	
	animated_sprite.set_animation("ready")
	click.play()
	
	shoot_timer.start()


func _on_shoot_timeout():
	set = false
	end = true
	
	animated_sprite.set_animation("bang")
	music.stop()
	shoot.play()
