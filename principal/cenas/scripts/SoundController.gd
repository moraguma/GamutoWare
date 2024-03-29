extends Node


const OFF_DB = -80.0
const ON_DB = 0.0

const MENU_IDX = 1
const GAME_IDX = 2

const DECAY_ACCEL = 0.05


var menu_aim_db = -80.0
var game_aim_db = -80.0


@onready var menu = $Music/Menu
@onready var intro = $Music/GameIntro
@onready var loop = $Music/GameLoop
@onready var sfx = {"click": $Node/Click, "damage": $Node/Damage, "throw": $Node/Throw, "win": $Node/Win}


func _process(delta):
	AudioServer.set_bus_volume_db(MENU_IDX, lerp(AudioServer.get_bus_volume_db(MENU_IDX), menu_aim_db, DECAY_ACCEL))
	AudioServer.set_bus_volume_db(GAME_IDX, lerp(AudioServer.get_bus_volume_db(GAME_IDX), game_aim_db, DECAY_ACCEL))


func play_menu():
	if menu_aim_db != ON_DB:
		menu.play()
		
		menu_aim_db = ON_DB
		game_aim_db = OFF_DB


func play_game():
	intro.play()
	loop.play()
	loop.volume_db = OFF_DB
	
	menu_aim_db = OFF_DB
	game_aim_db = ON_DB


func mute_game():
	game_aim_db = OFF_DB


func unmute_game():
	game_aim_db = ON_DB


func start_loop():
	loop.seek(0)
	loop.volume_db = ON_DB
	intro.stop()


func play_sfx(name):
	sfx[name].stop()
	sfx[name].play()
