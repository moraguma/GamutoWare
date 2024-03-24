extends RigidBody2D
signal lose
signal win
var points = 1
func _on_visible_on_screen_notifier_2d_screen_exited():
	var vidas = get_parent()
	vidas.vidas -= points
	queue_free()
	

func _ready():
	await get_tree().create_timer(3).timeout
	get_parent().get_node("CarTimer").stop()
