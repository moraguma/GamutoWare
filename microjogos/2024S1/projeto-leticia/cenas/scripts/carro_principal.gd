extends Area2D
signal lose

var esta_em_cima = true
var is_lose = false

func _process(delta):
	if Input.is_action_just_pressed("cima") and not is_lose:
		if not esta_em_cima:
			position.y -= 150
			z_index = -1
			esta_em_cima= true
	if Input.is_action_just_pressed("baixo") and not is_lose: 
		if esta_em_cima:
			position.y += 150
			z_index = 1
			esta_em_cima = false

func _on_body_entered(body):
	is_lose = true
	lose.emit()
