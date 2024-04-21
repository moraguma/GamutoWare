extends Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_timer_timeout():
	$Line2D.width = 0.0

func detected():
	$Line2D.width = 10.0
	$Timer.start()


