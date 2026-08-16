extends Node2D

var index = 0
var combo_list = ["UD","UL","UR","UA","DL","DR","DA","LR","LA","RA"]
var input_string = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	combo_list.shuffle()
	combo_list = combo_list.slice(0, 8)
	update_animations()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if index > 6:
		return
	input_string = ""
	if Input.is_action_pressed("cima"): input_string += 'U' 
	if Input.is_action_pressed("baixo"): input_string += 'D' 
	if Input.is_action_pressed("esquerda"): input_string += 'L' 
	if Input.is_action_pressed("direita"): input_string += 'R' 
	if Input.is_action_pressed("acao"): input_string += 'A' 

	
	if combo_list[index] == input_string:
		index += 1
		$"boss".play("hit")
		$AudioStreamPlayer2.play()
		#increase panning speed
		if index > 6:
			Minigames.register_win(self)
			$AudioStreamPlayer3.play()
			$"boss".play("death")
			$"arrow_left".play("false")
			$"arrow_right".play("false")
			$"arrow_up".play("false")
			$"arrow_down".play("false")
			$"action".play("false")
		else:
			update_animations()
	
func update_animations():
	if "L" in combo_list[index]:
		$"arrow_left".play("true")
	else:
		$"arrow_left".play("false")
	if "R" in combo_list[index]:
		$"arrow_right".play("true")
	else:
		$"arrow_right".play("false")
	if "U" in combo_list[index]:
		$"arrow_up".play("true")
	else:
		$"arrow_up".play("false")
	if "D" in combo_list[index]:
		$"arrow_down".play("true")
	else:
		$"arrow_down".play("false")
	if "A" in combo_list[index]:
		$"action".play("true")
	else:
		$"action".play("false")


func _on_boss_animation_finished():
	if index < 8 :
			$"boss".play("fly")
	else:
			$"boss".queue_free()
