extends "res://principal/cenas/scripts/ToTitle.gd"


func set_score(n):
	match Global.language:
		Global.LANGUAGE.PT:
			$Score.bbcode_text = "[center][wave amp=100 freq=5]PONTOS:\n" + str(n) 
		Global.LANGUAGE.EN:
			$Score.bbcode_text = "[center][wave amp=100 freq=5]SCORE:\n" + str(n) 
