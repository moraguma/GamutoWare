extends Area2D


var active = true


const STEP_SIZE = 16


@onready var main = get_parent()
@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

@onready var music = $Music
@onready var splat = $Splat
@onready var yay = $Yay


func _ready():
	animation_player.play("down")
	
	music.play()


func _physics_process(delta):
	if active:
		var dir = Vector2(0, 0)
		
		if Input.is_action_just_pressed("cima"):
			dir = Vector2(0, -1)
			animation_player.play("up")
		if Input.is_action_just_pressed("direita"):
			dir = Vector2(1, 0)
			animation_player.play("side")
			sprite.flip_h = false
		if Input.is_action_just_pressed("baixo"):
			dir = Vector2(0, 1)
			animation_player.play("down")
		if Input.is_action_just_pressed("esquerda"):
			dir = Vector2(-1, 0)
			animation_player.play("side")
			sprite.flip_h = true
		
		if dir != Vector2(0, 0):
			position += dir * STEP_SIZE
			main.step()
			
			if position[1] <= STEP_SIZE:
				yay.play()
				
				active = false
				main.register_win()


# Chamada quando entra em outra. Mata o jogador
func hit(area):
	music.stop()
	splat.play()
	
	active = false
	hide()
	
	main.register_lose()
