extends Node

@onready var gamutoPhysicsScene : PackedScene = preload("res://microjogos/2025S1/gamuto_snap/cenas/gamutoPhysics.tscn")
@onready var possible_vel_x : Array = [-250, -150, -50, 50, 150, 250]
@onready var possible_vel_ang : Array = [-50, -25, 0, 25, 50]

# Função que instanceia uam cena de um Gamuto com física na cena principal
func _on_gamutinhos_this_was_snapped(gamutoArea : Area2D) -> void:
	var gamutoPhysics = gamutoPhysicsScene.instantiate()
	gamutoPhysics.linear_velocity.x = possible_vel_x[randi() % 6]
	gamutoPhysics.angular_velocity = possible_vel_ang[randi() % 5]
	pass_properties(gamutoPhysics, gamutoArea)
	add_child(gamutoPhysics)

# Função para passar os parâmetros do Gamuto que foi atingido para o Gamuto físico que deve cair da cena
func pass_properties(gamutoPhysics : RigidBody2D, gamutoArea : Area2D):
	gamutoPhysics.position = gamutoArea.global_position
	gamutoPhysics.rotation = gamutoArea.rotation
	gamutoPhysics.get_child(0).scale = gamutoArea.get_child(0).global_scale
