extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Função chamada quando um corpo entra na área
func _on_body_entered(body: PhysicsBody2D) -> void:
	print("O corpo entrou na área!")
