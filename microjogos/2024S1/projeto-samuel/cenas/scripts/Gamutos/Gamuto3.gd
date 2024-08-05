extends CharacterBody2D

signal G3

func _ready():
	velocity.y = 0.0001

func _on_area_2d_body_entered(body):
	if velocity.y != 0:
		$Gamuto0.visible = false
		get_node("../Yay").play()
		velocity.y = 0
		emit_signal("G3")
