extends "res://principal/cenas/scripts/PressableButton.gd"


const GAME_PATH = "res://principal/cenas/Jogo.tscn"


onready var toggles = get_node("../Toggles").get_children()


func _pressed():
	var microgame_paths = []
	
	for toggle in toggles:
		if toggle.toggled:
			microgame_paths.append_array(toggle.microgame_paths)
	
	if len(microgame_paths) > 0:
		call_transition(microgame_paths)
	else:
		match Global.language:
			Global.LANGUAGE.PT:
				NotificationCenter.notify("Selecione pelo menos um pack!")
			Global.LANGUAGE.EN:
				NotificationCenter.notify("Select at least one minigame pack!")


func call_transition(microgame_paths):
	pass
