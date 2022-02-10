extends Node2D

const VALID_TILES = [0, 1, 2, 3]

const PLAYER_SPAWN_POSITIONS = [Vector2(56, 88), Vector2(184, 88), Vector2(120, 40)]
const CANDLE_SPAWN_POSITIONS = [Vector2(72, 88), Vector2(168, 88), Vector2(120, 56)]
const WIN_SPAWN_POSITIONS = [Vector2(40, 88), Vector2(200, 88), Vector2(120, 24)]
const WIN_HORIZONTAL_STATES = [false, false, true]


onready var tiles = $Tiles
onready var player = $Player
onready var candle = $Candle
onready var winning_area = $WinningArea


func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("EMPURRE!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("PUSH!")
	
	randomize()
	
	var player_code = randi() % 3
	var win_code = randi() % 3
	
	player.position = PLAYER_SPAWN_POSITIONS[player_code]
	player.force_update_cell_pos()
	candle.position = CANDLE_SPAWN_POSITIONS[player_code]
	candle.force_update_cell_pos()
	
	winning_area.position = WIN_SPAWN_POSITIONS[win_code]
	winning_area.is_horizontal = WIN_HORIZONTAL_STATES[win_code]


func has_floor(cell_pos):
	return tiles.get_cellv(cell_pos) in VALID_TILES


func win():
	get_parent().get_parent().emit_signal("win")
