extends Node2D

class_name GhostSkullsMain

signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080

var winnable = true
var losable = true

@export var enemy: Node2D

func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("Mate o inimigo!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("Kill the enemy!")
	
	randomize()


func register_win():
	print("win")
	emit_signal("win")

func register_lose():
	print("lose")
	emit_signal("lose")


func _on_victory_body_entered(player_1: Node2D) -> void:
	if player_1.is_in_group("player"):
		register_win()
		enemy.queue_free()
		
