extends Node2D

signal win
signal lose

func _on_timer_timeout() -> void:
	emit_signal("lose")
