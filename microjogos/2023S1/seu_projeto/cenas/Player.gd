extends CharacterBody2D

var velocidade = 0.08
var giro = 0
func _physics_process(delta):
	rotate(giro)
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		giro = direction * velocidade
	else:
		giro = 0



		
