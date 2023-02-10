extends "res://microjogos/moraguma/candle prick/cenas/scripts/Element.gd"


onready var hit_detector = $HitDetector
onready var move_sound = $MoveSound
onready var nope_sound = $NopeSound

onready var parent = get_parent()

onready var camera = parent.get_node("Camera")


func _physics_process(delta):
	var dir = get_input_dir()
	
	if dir != Vector2(0, 0):
		if parent.has_floor(cell_pos + dir):
			hit_detector.cast_to = dir * CELL_SIZE
			hit_detector.force_raycast_update()
			if hit_detector.is_colliding():
				hit_detector.get_collider().move(dir)
			
			move_sound.play()
			move(dir)
		else:
			nope_sound.play()
			camera.add_trauma()


func get_input_dir():
	if Input.is_action_just_pressed("cima"):
		return Vector2(0, -1)
	if Input.is_action_just_pressed("direita"):
		return Vector2(1, 0)
	if Input.is_action_just_pressed("baixo"):
		return Vector2(0, 1)
	if Input.is_action_just_pressed("esquerda"):
		return Vector2(-1, 0)
	return Vector2(0, 0)
