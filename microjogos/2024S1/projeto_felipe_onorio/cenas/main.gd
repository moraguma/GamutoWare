extends Node2D

signal win
signal lose

var node_to_be_consumed_1: Node2D
var node_to_be_consumed_2: Node2D
var node_to_be_consumed_string_1: String = ""
var node_to_be_consumed_string_2: String = ""
var base_node_name: String = "area_cell_"
@export var status_checker: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var win_animations = $win_animation
	win_animations.hide()
	print("test ORDER: main _ready()")
	
	#some_node = get_node("area_cell_" + str(0))
	#some_node.state = some_node.State.THIRD
	#some_node.update()
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
	
	var initial_state_offset = randi() % 3
	
	var cell_map = status_checker.cell_map
	
	for index in cell_map:
		cell_map[index].state = cell_map[index].state + initial_state_offset
		cell_map[index].update()
	
	node_to_be_consumed_1.state = node_to_be_consumed_1.State.EMPTY
	node_to_be_consumed_2.state = node_to_be_consumed_2.State.EMPTY
	# make invisible without changing states or sprites lol
	node_to_be_consumed_1.apply_scale(Vector2(0.001,0.001))
	node_to_be_consumed_2.apply_scale(Vector2(0.001,0.001))
	node_to_be_consumed_1.exterminated = true
	node_to_be_consumed_2.exterminated = true
	#node_to_be_consumed_1.update()
	#node_to_be_consumed_2.update()
	
	print("test ORDER: main updated cell_0")
	pass # Replace with function body.

func game_won():
	var win_animations = $win_animation
	win_animations.show()
	win_animations.play("default")
	win.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_cursor_area_win_condition():
	game_won()
	pass # Replace with function body.
