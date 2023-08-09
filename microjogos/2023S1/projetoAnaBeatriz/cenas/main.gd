extends Node2D

var timer
func _ready():
	timer = get_node("Timer")
	timer.start(6)


func _on_timer_timeout():
	get_tree().quit()
