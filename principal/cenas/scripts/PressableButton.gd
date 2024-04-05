extends Button


@export var start_focused = false


@export var translation_code: String


func _ready():
	focus_mode = Control.FOCUS_ALL
	if start_focused:
		grab_focus()
	
	update_translation()
	
	add_to_group("translatable")


func try_set_focus_neighbour(margin, path):
	if path != "":
		set_focus_neighbor(margin, path)


func _pressed():
	SoundController.play_sfx("click")


func update_translation():
	if translation_code != "":
		text = TranslationManager.get_translation(translation_code)
