extends Node

@onready var gamutoFisicoCena : PackedScene = preload("res://microjogos/2025S1/gamuto_snap/cenas/gamutoPhysics.tscn")

# Função que instanceia uam cena de um Gamuto com física na cena principal
func _on_gamutinhos_this_was_snapped(gamutoArea: Area2D) -> void:
	var gamutoFisico = gamutoFisicoCena.instantiate()
	gamutoFisico.position = gamutoArea.global_position
	add_child(gamutoFisico)
	
