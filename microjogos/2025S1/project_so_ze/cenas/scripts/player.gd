extends Node2D

var timer
var won = false
var transforme = false
var fail = false

var head_value = 0
var larm_value = 1
var rarm_value = 2
var legs_value = 3

var head_index
var larm_index
var rarm_index
var legs_index

var head = false
var larm = false
var rarm = false
var legs = false

var randomized_member = [0,1,2,3]

var randomized_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomized_member.shuffle()
	for i in range(4):
		if randomized_member[i] == head_value:
			head_index = i
			get_node("NumberUp").frame = head_index
		if randomized_member[i] == larm_value:
			larm_index = i
			get_node("NumberLeft").frame = larm_index
		if randomized_member[i] == rarm_value:
			rarm_index = i
			get_node("NumberRight").frame = rarm_index
		if randomized_member[i] == legs_value:
			legs_index = i
			get_node("NumberDown").frame = legs_index
	timer = get_node("Timer")
	timer.start(6)
	

func _process(delta: float) -> void:
	if timer.get_time_left() == 0:
		get_node("Fail").show()
		get_node("..").register_lose()
	if randomized_index == 4 and fail == false and not won:
		won = true
		get_node("Transform").show()
	if fail:
		get_node("Fail").show()
		get_node("..").register_lose()
		
