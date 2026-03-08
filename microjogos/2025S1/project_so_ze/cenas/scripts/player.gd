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
			get_node("Up/NumberUp").frame = head.index
		if randomized_member[i] == 1:
			left_arm.index = i
			get_node("Left/NumberLeft").frame = left_arm.index
		if randomized_member[i] == 2:
			right_arm.index = i
			get_node("Right/NumberRight").frame = right_arm.index
		if randomized_member[i] == 3:
			legs.index = i
			get_node("Down/NumberDown").frame = legs.index
	timer.start(5.5)
	

func add_part(body_part):
	current_index += 1
	if current_index == 4:
			get_node("Transform").show()
			timer.stop()

func lose() -> void:
	fail = true
	get_node("Fail").show()
	get_parent().register_lose()
	$LoseSound.play()

func win():
	won = true
	get_node("Body").hide()
	get_node("Head").hide()
	get_node("RightArm").hide()
	get_node("LeftArm").hide()
	get_node("Legs").hide()
	get_node("Left").hide()
	get_node("Right").hide()
	get_node("Up").hide()
	get_node("Down").hide()
	get_node("Transformation").show()
	get_parent().register_win()
