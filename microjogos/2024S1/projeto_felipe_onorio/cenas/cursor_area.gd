extends Area2D

@export var current_cell: Node
var counter: int = 0

func move_right():
	if current_cell.right_neighbor != null:
		current_cell = current_cell.right_neighbor
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

# Called when the node enters the scene tree for the first time.
func _ready():
	#current_cell  = get_node(^"../area_cell_0")
	print("AAAAAAAAAAAAAAAA")
	#position = Vector2(222,111)
	print("BBBBBBBBBBBBB")
	#var misc_position = current_cell.position
	print("CCCCCCCCCCC")
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

func _on_control_right_pressed():
	move_right()
func _on_control_left_pressed():
	move_left()
func _on_control_up_pressed():
	move_up()
func _on_control_down_pressed():
	move_down()
func _on_control_space_pressed():
	print("acao handled in cursor with no effect")
