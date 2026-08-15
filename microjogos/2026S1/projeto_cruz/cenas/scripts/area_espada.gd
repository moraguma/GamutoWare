extends Area2D

@export var duracao_ataque: float = 0.3

func _ready():

	await get_tree().create_timer(duracao_ataque).timeout
	queue_free()

func _on_area_entered(area: Area2D):
	if area.is_in_group("Esqueletos"):
		area.get_parent().queue_free()
