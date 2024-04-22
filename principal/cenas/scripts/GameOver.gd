extends "res://principal/cenas/scripts/ToTitle.gd"


func set_score(n):
	if Global.get_highscore() < n:
		Global.set_highscore(n)
	
	$Score.text = "[center][wave amp=100 freq=5]" + TranslationManager.get_translation("score")+ ": " + str(n)
	$Highscore.text = "[center][shake level=20]" + TranslationManager.get_translation("highscore") + ": " + str(Global.get_highscore())
