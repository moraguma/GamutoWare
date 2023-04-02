extends CharacterBody2D

var comi = 0
const SPEED = 300.0


func _physics_process(delta):
	var dir = (Vector2(1,0)*(Input.get_action_strength("direita")-Input.get_action_strength("esquerda")))
	velocity = dir * SPEED
	position += velocity*delta
	move_and_slide()
	
func soma_comida():
	comi += 1
	if comi == 3:
		get_parent().register_win()

func _on_area_2d_area_entered(area):
	#area.queue_free()
	#soma_comida()
	pass # Replace with function body.
