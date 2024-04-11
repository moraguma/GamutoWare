extends CharacterBody2D
const velocidade = 300
var dirfuga = Vector2(0,0)
var is_dead: bool = false
func _morrer():
	hide()

func _on_hitboxovelha_area_entered(area):
	if area.name == "hitboxlobo":
		print("lobo")
		_morrer()
	pass # Replace with function body.

func _on_sensacao_area_entered(area):
	if area.name == "hitboxlobo":
		dirfuga = Vector2((-get_node("../../Lobo/CorpoLobo").global_position + $"../../Cabra/ovelha".global_position).normalized())
		$"../../".register_win()
		
func _physics_process(delta):
	$"../../Cabra/ovelha".velocity = dirfuga * Vector2(100, 100)
	move_and_slide()
	pass # Replace with function body.
	

	
