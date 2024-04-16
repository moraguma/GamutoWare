extends Node2D

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

@onready var row_map: Array = [
	[ cell_map[0],cell_map[1],cell_map[2] ],
	[ cell_map[3],cell_map[4],cell_map[5] ],
	[ cell_map[6],cell_map[7],cell_map[8] ]
]

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

func _ready():
	pass

func _process(_delta):
	pass
