extends Area2D

func _on_timer_timeout():
	$Line2D.width = 0.0

func detected():
	$Line2D.width = 10.0
	$Timer.start()
