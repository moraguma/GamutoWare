extends CharacterBody2D
const velocidade = 300
var dirfuga = Vector2(0,0)
var is_dead: bool = false

func _morrer():
	$WinSound.play()
	is_dead = true
	hide()

func _on_hitboxovelha_area_entered(area):
	if area.name == "hitboxlobo" and not is_dead:
		_morrer()
		get_parent().get_parent().register_win()
	pass # Replace with function body.

func _on_sensacao_area_entered(area):
	if area.name == "hitboxlobo":
		dirfuga = Vector2((-get_node("../../Lobo/CorpoLobo").global_position + global_position).normalized())
		
func _physics_process(delta):
	velocity = dirfuga * Vector2(100, 100)
	move_and_slide()
	pass # Replace with function body.
	

	
