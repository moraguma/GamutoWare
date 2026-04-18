extends Node2D

signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080
var tempoativo = 1
var tem_bala = true

@export var intro : Timer
@export var sprite : Timer
@export var player : CharacterBody2D
@export var enemy : CharacterBody2D

func _ready():
	intro.start(randf_range(3,5))
	get_node("sino").play()

func _physics_process(delta):
	if Input.is_action_just_pressed("acao"):
		if tempoativo == 2 and tem_bala:
			player.atirar()
			enemy.morrer()
			tem_bala = false
			register_win()
		elif tem_bala:
			enemy.atirar()
			player.morrer()
			tem_bala = false
			register_lose()
	
func _on_tempo_intro_timeout():
	get_node("atire").visible = true
	sprite.start(0.5)
	tempoativo = 2
	
func _on_sprite_timeout():
	tempoativo = 1
	get_node("atire").visible = false
	if tem_bala:
		enemy.atirar()
		player.morrer()
		tem_bala = false
		register_lose()
		
func register_win():
	emit_signal("win")

func register_lose():
	emit_signal("lose")
