extends CollisionShape2D

# Chamado quando o nó entra na árvore da cena pela primeira vez.
func _ready():
	# Defina a área de colisão
	shape = CircleShape2D.new()
	shape.set_radius(32)
	set_shape(shape)

	
# Chamado quando um corpo entra na área de colisão
func _on_body_entered(body: PhysicsBody2D) -> void:
	print("Corpo entrou na área!")
