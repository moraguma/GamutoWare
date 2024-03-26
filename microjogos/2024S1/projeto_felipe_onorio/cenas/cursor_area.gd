extends Area2D

@export var current_cell: Node
var counter: int = 0

signal activate_cell()

# syntax for dynamic connection: signalling_node.connect("signal_name", receiving_node, "signal_handler")

func disconnect_signal_handler():
	activate_cell.disconnect(current_cell._on_cursor_area_activate_cell)

func connect_signal_handler():
	activate_cell.connect(current_cell._on_cursor_area_activate_cell)

func move_right():
	if current_cell.right_neighbor != null:
		#current_cell.disconnect()
		current_cell = current_cell.right_neighbor
		#activate_cell.connect(current_cell._on_cursor_area_activate_cell)
	else:
		#todo: fun visual effect
		print("out of bounds: right")

func move_left():
	if current_cell.left_neighbor != null:
		current_cell = current_cell.left_neighbor
	else:
		#todo: fun visual effect
		print("out of bounds: left")

func move_up():
	if current_cell.up_neighbor != null:
		current_cell = current_cell.up_neighbor
	else:
		#todo: fun visual effect
		print("out of bounds: up")

func move_down():
	if current_cell.down_neighbor != null:
		current_cell = current_cell.down_neighbor
	else:
		#todo: fun visual effect
		print("out of bounds: down")
		pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#current_cell  = get_node(^"../area_cell_0")
	#print("AAAAAAAAAAAAAAAA")
	#position = Vector2(222,111)
	#print("BBBBBBBBBBBBB")
	#var misc_position = current_cell.position
	#print("CCCCCCCCCCC")
	#position = misc_position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = current_cell.position
	#if counter % 4 == 0:
		#move_right()
	#if counter % 4 == 1:
		#move_down()
	#if counter % 4 == 2:
		#move_left()
	#if counter % 4 == 3:
		#move_up()
	#counter += 1

func _on_control_xxxx():
	pass # Replace with function body.

func activate_current_cell():
	activate_cell.emit()

func _on_control_right_pressed():
	disconnect_signal_handler()
	move_right()
	connect_signal_handler()
func _on_control_left_pressed():
	disconnect_signal_handler()
	move_left()
	connect_signal_handler()
func _on_control_up_pressed():
	disconnect_signal_handler()
	move_up()
	connect_signal_handler()
func _on_control_down_pressed():
	disconnect_signal_handler()
	move_down()
	connect_signal_handler()
func _on_control_space_pressed():
	activate_current_cell()
	#print("acao handled in cursor with no effect")
