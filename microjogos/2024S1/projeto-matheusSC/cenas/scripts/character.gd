extends Sprite2D


@export var left_spr : Texture2D
#@export var right_spr : Texture2D
@export var up_spr : Texture2D
@export var down_spr : Texture2D
@export var idle_spr : Texture2D
@export var perdeu_spr : Texture2D

var main_scene

func _ready():
	main_scene = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#set texture based on press
	if main_scene.current_pressed == "esquerda":
		flip_h = false
		texture = left_spr
	elif main_scene.current_pressed == "direita":
		flip_h = true
		texture = left_spr
	elif main_scene.current_pressed == "cima":
		flip_h = false
		texture = up_spr
	elif main_scene.current_pressed == "baixo":
		flip_h = false
		texture = down_spr
	else:
		flip_h = false
		texture = idle_spr
		
	if main_scene.perdeu:
		flip_h = false
		texture = perdeu_spr
	pass
