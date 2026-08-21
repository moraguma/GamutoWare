extends Node2D

@export var timer : Timer
@export var head : Sprite2D
@export var right_arm : Sprite2D
@export var left_arm : Sprite2D
@export var legs : Sprite2D

var won = false
var fail = false
var randomized_member = [0,1,2,3]
var current_index = 0
var body_parts = []
# Called when the node enters the scene tree for the first time.
func _ready():
	randomized_member.shuffle()
	for i in range(4):
		if randomized_member[i] == 0:
			head.index = i
			get_node("TranformationParts/Up/NumberUp").frame = head.index
		if randomized_member[i] == 1:
			left_arm.index = i
			get_node("TranformationParts/Left/NumberLeft").frame = left_arm.index
		if randomized_member[i] == 2:
			right_arm.index = i
			get_node("TranformationParts/Right/NumberRight").frame = right_arm.index
		if randomized_member[i] == 3:
			legs.index = i
			get_node("TranformationParts/Down/NumberDown").frame = legs.index	

func add_part(body_part):
	current_index += 1
	if current_index == 4:
			get_node("TranformationParts/Transform").show()
			timer.stop()

func lose() -> void:
	fail = true
	get_node("Fail").show()
	timer.stop()
	$LoseSound.play()
	Minigames.register_lose(self)

func win() -> void:
	won = true
	get_node("TranformationParts").hide()
	get_node("Transformation").show()
	get_node("TranformationParts/Transform/AudioStreamPlayer").play()
	Minigames.register_win(self)
	
func _input(event: InputEvent) -> void:
	if not fail and not won and event.is_action_pressed("acao"):
		win() if current_index == 4 else lose()
