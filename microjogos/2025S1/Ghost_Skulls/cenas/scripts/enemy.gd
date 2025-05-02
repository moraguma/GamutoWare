extends Area2D

@onready var fireball = preload("res://microjogos/2025S1/Ghost_Skulls/cenas/projetil.tscn")

func _on_timer_timeout() -> void:
	var fireball_instance = fireball.instantiate()
	fireball_instance.main = get_parent()
	add_child(fireball_instance)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		register_lose()
		body.queue_free()
	
func register_lose():
	print("lose")
	emit_signal("lose")
