extends "res://principal/cenas/scripts/GameButton.gd"


func call_transition(microgame_paths):
	Global.goto_scene_and_call(GAME_PATH, "setup_arcade_mode", [microgame_paths])
