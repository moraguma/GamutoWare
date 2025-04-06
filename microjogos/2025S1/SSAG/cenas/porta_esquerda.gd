extends Area2D

var new_texture = preload("res://microjogos/2025S1/SSAG/ouuu.png")
var old_texture = preload("res://microjogos/2025S1/SSAG/untitled.png")
func _ready():
	$portaesq.texture = new_texture
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("direita")):
		$portaesq.texture = old_texture
	
