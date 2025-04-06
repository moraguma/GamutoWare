extends Node

@onready var gamutoFisicoCena : PackedScene = preload("res://microjogos/2025S1/gamuto_snap/cenas/gamutoPhysics.tscn")

# Função que instanceia uam cena de um Gamuto com física na cena principal
func _on_gamutinhos_this_was_snapped(gamutoArea : Area2D) -> void:
	var gamutoFisico = gamutoFisicoCena.instantiate()
	pass_properties(gamutoFisico, gamutoArea)
	add_child(gamutoFisico)

# Função para passar os parâmetros do Gamuto que foi atingido para o Gamuto físico que deve cair da cena
func pass_properties(gamutoFisico : RigidBody2D, gamutoArea : Area2D):
	gamutoFisico.position = gamutoArea.global_position
	gamutoFisico.rotation = gamutoArea.rotation
	gamutoFisico.get_child(0).scale = gamutoArea.get_child(0).global_scale
