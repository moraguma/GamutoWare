extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_timer_timeout():
	$Line2D.visible = false


func _on_area_entered(area):
	print("Detectada pedra 8")
	if area.is_in_group("Sonar"):
		print("Detectada pedra 8")
		$Line2D.visible = true
		$Timer.start()

func On_body_entered(body):
	emit_signal("lose")
