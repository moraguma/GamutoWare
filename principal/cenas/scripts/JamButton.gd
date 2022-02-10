extends Button


const GAME_PATH = "res://principal/cenas/Jogo.tscn"


export (Array, String) var microgame_paths


func _ready():
	connect("pressed", self, "transition")


func transition():
	Global.goto_scene_and_call(GAME_PATH, "setup_jam_mode", [microgame_paths])
