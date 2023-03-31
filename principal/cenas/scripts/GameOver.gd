extends "res://principal/cenas/scripts/ToTitle.gd"


func set_score(n):
	if Global.get_highscore() < n:
		Global.set_highscore(n)
	
	match Global.language:
		Global.LANGUAGE.PT:
			$Score.text = "[center][wave amp=100 freq=5]PONTOS: " + str(n) 
			$Highscore.text = "[center][shake level=20]RECORDE: " + str(Global.get_highscore())
		Global.LANGUAGE.EN:
			$Score.text = "[center][wave amp=100 freq=5]SCORE: " + str(n) 
			$Highscore.text = "[center][shake level=20]HIGHSCORE: " + str(Global.get_highscore())
