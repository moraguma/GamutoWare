extends Node2D

signal win()
signal lose()

const WIDTH = 1920
const HEIGHT = 1080

signal right_pressed
signal down_pressed
signal up_pressed
signal left_pressed
signal space_pressed

var node_to_be_consumed_1: Node2D
var node_to_be_consumed_2: Node2D
var node_to_be_consumed_string_1: String = ""
var node_to_be_consumed_string_2: String = ""

var base_node_name: String = "status_checker/area_cell_"
@onready var status_checker: Node2D = $status_checker

func _ready():
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("COMPLETE!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("COMPLETE!")
	
	var rand1 = randi() % 8
	var rand2 = randi() % 8
	if rand1 == rand2:
		rand2 = (rand2 + 1) % 8
	node_to_be_consumed_string_1 = str(base_node_name, rand1)
	node_to_be_consumed_string_2 = str(base_node_name, rand2)
	print("random1 generated: ", node_to_be_consumed_string_1)
	print("random2 generated: ", node_to_be_consumed_string_2)
	node_to_be_consumed_1 = get_node(node_to_be_consumed_string_1)
	node_to_be_consumed_2 = get_node(node_to_be_consumed_string_2)
	
	var initial_state_offset = ( randi() % 3 )
		
	var cell_map = status_checker.cell_map
	
	for cell in cell_map:
		cell.state = ( cell.state + initial_state_offset ) % 3
		if cell.state == cell.State.EMPTY:
			cell.state = cell.State.THIRD
		cell.update()
	
	node_to_be_consumed_1.state = node_to_be_consumed_1.State.EMPTY
	node_to_be_consumed_2.state = node_to_be_consumed_2.State.EMPTY

	node_to_be_consumed_1.get_child(0).hide()
	node_to_be_consumed_2.get_child(0).hide()
	node_to_be_consumed_1.exterminated = true
	node_to_be_consumed_2.exterminated = true
	
	print("test ORDER: main updated cell_0")
	
	var win_animations = $interface_static_elements/win_animation
	win_animations.hide()
	print("test ORDER: main _ready()")
	pass

func game_won():
	var win_animations = $interface_static_elements/win_animation
	win_animations.show()
	win_animations.play("default")
	win.emit()
	

func _process(_delta):
	pass

func _on_cursor_area_win_condition():
	game_won()
	pass
