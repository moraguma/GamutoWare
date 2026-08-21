extends Node2D

@onready var paises = [$a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $a10, $a11]
var numero_rand : int

func _ready() -> void:
	$Sprite2D.play("sub_animado")
	

func _on_sprite_2d_animation_finished() -> void:
	$Sprite2D.play("sub_estatico")


func _on_timer_timeout() -> void:
	paises.shuffle()
	var pais = paises.pop_front()
	if pais:
		var cohete = pais.get_node("Cohete")
		cohete.ignicion()
