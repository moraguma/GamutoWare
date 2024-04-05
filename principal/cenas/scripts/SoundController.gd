extends Node


const OFF_DB = -80.0
const ON_DB = 0.0

const MENU_IDX = 1
const GAME_IDX = 2

const DECAY_ACCEL = 0.05

const MASTER_IDX = 0

var menu_aim_db = -80.0
var game_aim_db = -80.0


@onready var menu = $Music/Menu
@onready var intro = $Music/GameIntro
@onready var loop = $Music/GameLoop
@onready var sfx = {"click": $Node/Click, "damage": $Node/Damage, "throw": $Node/Throw, "win": $Node/Win}


func _process(delta):
	AudioServer.set_bus_volume_db(MENU_IDX, lerp(AudioServer.get_bus_volume_db(MENU_IDX), menu_aim_db, DECAY_ACCEL))
	AudioServer.set_bus_volume_db(GAME_IDX, lerp(AudioServer.get_bus_volume_db(GAME_IDX), game_aim_db, DECAY_ACCEL))
	if Input.is_action_just_pressed("silenciar"):
		if is_muted():
			unmute_all()
		else:
			mute_all()

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

func mute_menu():
	menu_aim_db = OFF_DB

func unmute_menu():
	menu_aim_db = ON_DB

func mute_all():
	AudioServer.set_bus_mute(MASTER_IDX, true)

func unmute_all():
	AudioServer.set_bus_mute(MASTER_IDX, false)
	
func is_muted()->bool:
	return AudioServer.is_bus_mute(MASTER_IDX)


func start_loop():
	loop.seek(0)
	loop.volume_db = ON_DB
	intro.stop()


func play_sfx(name):
	sfx[name].stop()
	sfx[name].play()
