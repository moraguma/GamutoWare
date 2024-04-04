extends Node2D

# dependencies:
# all area_cell_x
# status_checker
# win_animation

signal win()
signal lose()

#signal main_ready

signal right_pressed
signal down_pressed
signal up_pressed
signal left_pressed
signal space_pressed

var node_to_be_consumed_1: Node2D
var node_to_be_consumed_2: Node2D
var node_to_be_consumed_string_1: String = ""
var node_to_be_consumed_string_2: String = ""
# $cursor_area/status_checker/area_cell_0
var base_node_name: String = "status_checker/area_cell_"
@onready var status_checker: Node2D = $status_checker

#func connect_dependencies():
	#var rand1 = randi() % 8
	#var rand2 = randi() % 8
	#if rand1 == rand2:
		#rand2 = (rand2 + 1) % 8
	#node_to_be_consumed_string_1 = str(base_node_name, rand1)
	#node_to_be_consumed_string_2 = str(base_node_name, rand2)
	#print("random1 generated: ", node_to_be_consumed_string_1)
	#print("random2 generated: ", node_to_be_consumed_string_2)
	#node_to_be_consumed_1 = get_node(node_to_be_consumed_string_1)
	#node_to_be_consumed_2 = get_node(node_to_be_consumed_string_2)
	#
	#var initial_state_offset = randi() % 3
	#
	#var cell_map = status_checker.cell_map
	#
	#for index in cell_map:
		#cell_map[index].state = cell_map[index].state + initial_state_offset
		#cell_map[index].update()
	#
	#node_to_be_consumed_1.state = node_to_be_consumed_1.State.EMPTY
	#node_to_be_consumed_2.state = node_to_be_consumed_2.State.EMPTY
	## make invisible without changing states or sprites lol
	#node_to_be_consumed_1.apply_scale(Vector2(0.001,0.001))
	#node_to_be_consumed_2.apply_scale(Vector2(0.001,0.001))
	#node_to_be_consumed_1.exterminated = true
	#node_to_be_consumed_2.exterminated = true
	##node_to_be_consumed_1.update()
	##node_to_be_consumed_2.update()
	#
	#print("test ORDER: main updated cell_0")
	#
	#var win_animations = $win_animation
	#win_animations.hide()
	#print("test ORDER: main _ready()")
	#pass

# Called when the node enters the scene tree for the first time.
func _ready():
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
	
	#(3 + 0 ) % 3     -> 0  | expected 3
	#(3 + 1 ) % 3     -> 1  | expected 1
	#(3 + 2 ) % 3     -> 2  | expected 2
	
	#(2 + 0 ) % 3     -> 2  | expected 2
	#(2 + 1 ) % 3     -> 0  | expected 3
	#(2 + 2 ) % 3     -> 1  | expected 1
	
	#(1 + 0 ) % 3     -> 1  | expected 1
	#(1 + 1 ) % 3     -> 2  | expected 2
	#(1 + 2 ) % 3     -> 0  | expected 3
	
	# offset +0  +1  +2
	#    1 -> 1 / 2 / 3
	#    2 -> 2 / 3 / 1
	#    3 -> 3 / 1 / 2
	
	var cell_map = status_checker.cell_map
	
	for cell in cell_map:
		cell.state = ( cell.state + initial_state_offset ) % 3
		if cell.state == cell.State.EMPTY:
			cell.state = cell.State.THIRD
		cell.update()
	
	node_to_be_consumed_1.state = node_to_be_consumed_1.State.EMPTY
	node_to_be_consumed_2.state = node_to_be_consumed_2.State.EMPTY
	# make invisible without changing states or sprites lol
	#node_to_be_consumed_1.apply_scale(Vector2(0.001,0.001))
	node_to_be_consumed_1.get_child(0).hide()
	#node_to_be_consumed_2.apply_scale(Vector2(0.001,0.001))
	node_to_be_consumed_2.get_child(0).hide()
	node_to_be_consumed_1.exterminated = true
	node_to_be_consumed_2.exterminated = true
	#node_to_be_consumed_1.update()
	#node_to_be_consumed_2.update()
	
	print("test ORDER: main updated cell_0")
	
	var win_animations = $interface_static_elements/win_animation
	win_animations.hide()
	print("test ORDER: main _ready()")
	#main_ready.emit()
	
	#some_node = get_node("area_cell_" + str(0))
	#some_node.state = some_node.State.THIRD
	#some_node.update()

	pass # Replace with function body.

func game_won():
	var win_animations = $interface_static_elements/win_animation
	win_animations.show()
	win_animations.play("default")
	win.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if Input.is_action_just_pressed("esquerda"):
		#print("esquerda handled")
		#left_pressed.emit()
	#if Input.is_action_just_pressed("direita"):
		#print("direita handled")
		#right_pressed.emit()
	#if Input.is_action_just_pressed("baixo"):
		#print("baixo handled")
		#down_pressed.emit()
	#if Input.is_action_just_pressed("cima"):
		#print("cima handled")
		#up_pressed.emit()
	#if Input.is_action_just_pressed("acao"):
		#print("acao handled")
		#space_pressed.emit()
	pass

func _on_cursor_area_win_condition():
	game_won()
	pass # Replace with function body.
