extends CharacterBody2D
const velocidade = 300
var dirfuga = Vector2(0,0)
var is_dead: bool = false

const SPEED = 80
const SLOW_DOWN_LERP_WEIGHT = 0.02
const SPEED_UP_LERP_WEIGHT = 0.2

var wolf = null


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
		wolf = get_node("../../Lobo/CorpoLobo")

func _on_sensacao_area_exited(area):
	if area.name == "hitboxlobo":
		wolf = null

func get_dir():
	if wolf == null:
		return Vector2(0, 0)
	
	var forward = Vector2((-wolf.global_position + global_position).normalized())
	var angle_to = wolf.velocity.angle_to(global_position - wolf.global_position)
	var ort = forward.rotated(angle_to / abs(angle_to) * PI / 2)
	
	var cur_speed = wolf.velocity.length()
	return (cur_speed * ort + (wolf.SPEED - cur_speed) * forward).normalized()

func _physics_process(delta):
	velocity = lerp(velocity, get_dir() * SPEED, SLOW_DOWN_LERP_WEIGHT if wolf == null else SPEED_UP_LERP_WEIGHT)
	move_and_slide()
