extends Area2D

@onready var current_cell: Node = $"../status_checker/area_cell_4"
@onready var cursor_sprite: Node2D = $cursor_sprite
@onready var status_checker: Node = $"../status_checker"
var counter: int = 0
var status: bool = false
var cursor_green = preload("res://microjogos/2024S1/projeto_felipe_onorio/recursos/placeholder_cursor_green_32x32.png")
var cursor_red = preload("res://microjogos/2024S1/projeto_felipe_onorio/recursos/placeholder_cursor_32x32 - Copy.png")

signal win_condition()
signal activate_cell()

func update_cursor_color():
	status = status_checker.check_row_and_column(current_cell.row, current_cell.column)
	if status == true:
		cursor_sprite.set_texture(cursor_green)
	else:
		cursor_sprite.set_texture(cursor_red)

func update_cursor_status():
	update_cursor_color()
	if status_checker.all_cells_ok():
		print("WIN CONDITION EMITTED!!!!")
		win_condition.emit()

# syntax for dynamic connection: signalling_node.connect("signal_name", receiving_node, "signal_handler")
func disconnect_signal_handler():
	activate_cell.disconnect(current_cell._on_cursor_area_activate_cell)

func connect_signal_handler():
	activate_cell.connect(current_cell._on_cursor_area_activate_cell)

func move_right():
	if current_cell.right_neighbor != null:
		current_cell = current_cell.right_neighbor
		update_cursor_status()
		update_cursor_position()
	else:
		#todo: fun visual effect
		print("out of bounds: right")

func move_left():
	if current_cell.left_neighbor != null:
		current_cell = current_cell.left_neighbor
		update_cursor_status()
		update_cursor_position()
	else:
		#todo: fun visual effect
		print("out of bounds: left")

func move_up():
	if current_cell.up_neighbor != null:
		current_cell = current_cell.up_neighbor
		update_cursor_status()
		update_cursor_position()
	else:
		#todo: fun visual effect
		print("out of bounds: up")

func move_down():
	if current_cell.down_neighbor != null:
		current_cell = current_cell.down_neighbor
		update_cursor_status()
		update_cursor_position()
	else:
		#todo: fun visual effect
		print("out of bounds: down")
		pass

func update_cursor_position():
	position = current_cell.position
	pass

func _ready():
	connect_signal_handler()
	update_cursor_color()
	update_cursor_position()
	pass

func _process(_delta):
	pass

func _on_control_xxxx():
	pass

func activate_current_cell():
	activate_cell.emit()
	update_cursor_status()

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
	update_cursor_status()

func _on_control_quit_pressed():
	get_tree().quit()
	pass

func _on_some_cell_touched(cell: Node):
	current_cell = cell
	update_cursor_status()
	update_cursor_position()

