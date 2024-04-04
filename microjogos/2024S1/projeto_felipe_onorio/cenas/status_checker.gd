extends Node2D

# dependencies:
# area_cell_x

#signal status_checker_ready


enum State {EMPTY, FIRST, SECOND, THIRD }

@onready var cell_map: Array = [
	$area_cell_0,
	$area_cell_1,
	$area_cell_2,
	$area_cell_3,
	$area_cell_4,
	$area_cell_5,
	$area_cell_6,
	$area_cell_7,
	$area_cell_8
]

	#row_map = {
		#0: [ cell_map[0],cell_map[1],cell_map[2] ],
		#1: [ cell_map[3],cell_map[4],cell_map[5] ],
		#2: [ cell_map[6],cell_map[7],cell_map[8] ],
	#}
	#column_map = {
		#0: [ cell_map[0],cell_map[3],cell_map[6] ],
		#1: [ cell_map[1],cell_map[4],cell_map[7] ],
		#2: [ cell_map[2],cell_map[5],cell_map[8] ]

#var row_map: Dictionary = {}
@onready var row_map: Array = [
	[ cell_map[0],cell_map[1],cell_map[2] ],
	[ cell_map[3],cell_map[4],cell_map[5] ],
	[ cell_map[6],cell_map[7],cell_map[8] ]
]
#var column_map: Dictionary = {}
@onready var column_map: Array = [
	[ cell_map[0],cell_map[3],cell_map[6] ],
	[ cell_map[1],cell_map[4],cell_map[7] ],
	[ cell_map[2],cell_map[5],cell_map[8] ]
]

func any_row_element_empty(row: int):
	var row_element_empty = ( row_map[row][0].state == State.EMPTY || 
								row_map[row][1].state == State.EMPTY || 
								row_map[row][2].state == State.EMPTY )
	return row_element_empty

func any_column_element_empty(column: int):
	var column_element_empty = ( column_map[column][0].state == State.EMPTY || 
								column_map[column][1].state == State.EMPTY || 
								column_map[column][2].state == State.EMPTY )
	return column_element_empty

func row_ok(row: int):
	if any_row_element_empty(row):
		return false
		
	var all_unique = ( row_map[row][0].state != row_map[row][1].state &&
						row_map[row][1].state != row_map[row][2].state &&
						row_map[row][2].state != row_map[row][0].state )
	return all_unique

func column_ok(column: int):
	if any_column_element_empty(column):
		return false
		
	var all_unique = ( column_map[column][0].state != column_map[column][1].state &&
						column_map[column][1].state != column_map[column][2].state &&
						column_map[column][2].state != column_map[column][0].state )
	return all_unique

func check_row_and_column(row: int, column: int):
	return (row_ok(row) && column_ok(column))

func all_cells_ok():
	var everything_is_fine = ( row_ok(0) && row_ok(1) && row_ok(2) &&
								column_ok(0) && column_ok(1) && column_ok(2) )
	return everything_is_fine

# TODO: functions for highlighting all repeated cells in a row or in a column

func _init():
	pass

#func connect_dependencies():
	##print("cell_map not ready")
	##cell_map = { 0: $"../area_cell_0",
				##1: $"../area_cell_1",
				##2: $"../area_cell_2",
				##3: $"../area_cell_3",
				##4: $"../area_cell_4",
				##5: $"../area_cell_5",
				##6: $"../area_cell_6",
				##7: $"../area_cell_7",
				##8: $"../area_cell_8"
	##}
	##print("cell_map ready")
	##row_map = {
		##0: [ cell_map[0],cell_map[1],cell_map[2] ],
		##1: [ cell_map[3],cell_map[4],cell_map[5] ],
		##2: [ cell_map[6],cell_map[7],cell_map[8] ],
	##}
	##column_map = {
		##0: [ cell_map[0],cell_map[3],cell_map[6] ],
		##1: [ cell_map[1],cell_map[4],cell_map[7] ],
		##2: [ cell_map[2],cell_map[5],cell_map[8] ]
	##}
	#pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#status_checker_ready.emit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
