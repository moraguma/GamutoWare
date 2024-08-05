extends "res://principal/cenas/scripts/PressableButton.gd"


@export var aim_language: int


func _pressed():
	TranslationManager.load_translation(aim_language)
