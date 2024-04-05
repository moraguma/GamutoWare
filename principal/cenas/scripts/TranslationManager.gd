extends Node

const TRANSLATIONS = {
	Global.LANGUAGE.PT: "res://principal/recursos/translations/pt.gd",
	Global.LANGUAGE.EN: "res://principal/recursos/translations/en.gd"
}

var translation

func _ready() -> void:
	load_translation(Global.get_language())


func load_translation(code):
	Global.set_language(code)
	
	Global.language = code
	
	var path = TRANSLATIONS[code]
	translation = load(path).new()
	get_tree().call_deferred("call_group", "translatable", "update_translation")


func get_translation(code: String):
	return translation.translations[code]
