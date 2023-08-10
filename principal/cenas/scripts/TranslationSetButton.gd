extends "res://principal/cenas/scripts/PressableButton.gd"


@export var translation_code: int


func _pressed():
	translate()


func translate():
	Global.update_translation(translation_code)
	get_tree().call_group("translatable", "update_translation")
