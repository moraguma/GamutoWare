extends Node2D

@onready var cena_estrela = preload("res://microjogos/2024S1/projeto-da-ana-luiza/cenas/estrela_amarela.tscn")

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	Minigames.register_win(self)

func spawn_estrela():
	var estrela_nova : RigidBody2D = cena_estrela.instantiate()
	estrela_nova.position.x = 960
	estrela_nova.position.y = 800.0
	estrela_nova.linear_velocity = Vector2(randf_range(-300, 300), -1400)
	add_child(estrela_nova)


func _on_area_2d_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("star"):
		Minigames.register_lose(self)
		body.delete()
