extends CharacterBody2D

const GRAVITY = 3000
const JUMP_VELOCITY = 1200

const CENA_ESPADA = preload("res://microjogos/2026S1/projeto_cruz/cenas/Espada.tscn")

@onready var sprite_normal = $sprite_normal
@onready var colisao_normal = $hitbox_normal
@onready var sprite_abaixado = $sprite_abaixado
@onready var colisao_abaixado = $hitbox_abaixado

func _input(event):
	if event.is_action_pressed("acao"):
		atacar()

func atacar():
	var nova_espada = CENA_ESPADA.instantiate()
	
	var direcao = 1
	if sprite_normal and sprite_normal.visible:
		direcao = -1 if sprite_normal.flip_h else 1
	elif sprite_abaixado and sprite_abaixado.visible:
		direcao = -1 if sprite_abaixado.flip_h else 1

	var altura_ataque = 0
	if sprite_abaixado.visible:
		altura_ataque = 10
		
	nova_espada.position = Vector2(200 * direcao, altura_ataque) 
	
	add_child(nova_espada)
	$SomAtaque.play()

func abaixar(condicao):
	sprite_normal.visible = !condicao
	sprite_abaixado.visible = condicao
	
	colisao_normal.set_deferred("disabled", condicao)
	colisao_abaixado.set_deferred("disabled", !condicao)

func _physics_process(delta):
	
	if Input.is_action_pressed("baixo"):
		abaixar(true)
	else:
		abaixar(false)
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("cima") and is_on_floor():
		velocity.y = -JUMP_VELOCITY
		$SomPulo.play()
	move_and_slide()
