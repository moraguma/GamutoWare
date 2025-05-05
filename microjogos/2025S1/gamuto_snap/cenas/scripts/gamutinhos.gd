extends Node

@onready var gamuto1 : Area2D = $gamuto1
@onready var gamuto2 : Area2D = $gamuto2
@onready var gamuto3 : Area2D = $gamuto3
@onready var gamuto4 : Area2D = $gamuto4
@onready var gamuto5 : Area2D = $gamuto5

signal any_was_snapped		# Sinal para passar que um Gamuto qualquer foi atingido
signal this_was_snapped(gamutoArea : Area2D)		# Sinal para passar qual Gamuto específico foi atingido

# Sinal emitido pelo player que dá qual gamuto foi atingido 
func _on_player_snapped_gamuto(gamuto : int) -> void:
	# Deleta o Gamuto que teve foto tirada
	match gamuto:
		1:
			print("YOU SNAPPED 1!")
			emit_signal("this_was_snapped", gamuto1)
			gamuto1.queue_free()
		2:
			print("YOU SNAPPED 2!")
			emit_signal("this_was_snapped", gamuto2)
			gamuto2.queue_free()
		3:
			print("YOU SNAPPED 3!")
			emit_signal("this_was_snapped", gamuto3)
			gamuto3.queue_free()
		4:
			print("YOU SNAPPED 4!")
			emit_signal("this_was_snapped", gamuto4)
			gamuto4.queue_free()
		5:
			print("YOU SNAPPED 5!")
			emit_signal("this_was_snapped", gamuto5)
			gamuto5.queue_free()
			
	emit_signal("any_was_snapped")
