extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_timer_timeout():
	$Line2D.visible = false


func _on_area_entered(area):
	if area.is_in_group("Sonar"):
		$Line2D.visible = true
		$Timer.start()
	if area.is_in_group("Player"):
		emit_signal("lose")
