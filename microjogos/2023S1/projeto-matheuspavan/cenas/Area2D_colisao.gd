extends Area2D

# Chamado quando o nó entra na árvore da cena pela primeira vez.
func _ready():
	pass

# Chamado quando um corpo entra na área de colisão
func _on_body_entered(body: PhysicsBody2D) -> void:
	print("Corpo entrou na área!")
