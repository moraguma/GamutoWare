extends Node2D

var posicion = Vector2(960, 540)
var rotacion : float = 0.1
@onready var paises = [$a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $a10, $a11]
var suma : float = 0
var numero_rand : int
var salio = false

@export var cohete : CharacterBody2D

func _ready() -> void:
	$Sprite2D.play("sub_animado")
	

func _physics_process(delta):
	suma += delta
	rotate(rotacion*delta)
	if suma > 0.4:
		numero_rand = randi_range(0,10)
		var cohete = paises[numero_rand].get_node("Cohete")
		cohete.ignicion()
		suma = 0


	


func _on_sprite_2d_animation_finished() -> void:
	$Sprite2D.play("sub_estatico")
