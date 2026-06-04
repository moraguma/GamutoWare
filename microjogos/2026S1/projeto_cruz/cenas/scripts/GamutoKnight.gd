extends CharacterBody2D

const GRAVITY = 1500.0
const JUMP_VELOCITY = 800.0

const CENA_ESPADA = preload("res://microjogos/2026S1/projeto_cruz/cenas/Espada.tscn")

@onready var sprite_normal = $Area_Knight/sprite_normal
@onready var colisao_normal = $Area_Knight/hitbox_normal
@onready var sprite_abaixado = $Area_Knight/sprite_abaixado
@onready var colisao_abaixado = $Area_Knight/hitbox_abaixado

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

func abaixar(bool):
	sprite_normal.visible = !bool
	sprite_abaixado.visible = bool
	
	colisao_normal.set_deferred("disabled", bool)
	colisao_abaixado.set_deferred("disabled", !bool)

func _physics_process(delta):
	
	if Input.is_action_pressed("baixo") and is_on_floor():
		abaixar(true)
	else:
		abaixar(false)
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("cima") and is_on_floor():
		velocity.y = -JUMP_VELOCITY
	
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("Esqueletos") or area.is_in_group("Flechas"):
		Minigames.register_lose(self)
		get_parent().queue_free()
		if area.is_in_group("Flechas"):
			area.get_parent().queue_free()
