extends Button


export var start_focused = false


export (String) var pt_text
export (String) var en_text


func _ready():
	focus_mode = Control.FOCUS_ALL
	if start_focused:
		grab_focus()
	
	update_translation()
	
	add_to_group("translatable")


func try_set_focus_neighbour(margin, path):
	if path != "":
		set_focus_neighbour(margin, path)


func _pressed():
	SoundController.play_sfx("click")


func update_translation():
	if pt_text != "" and en_text != "":
		match Global.language:
			Global.LANGUAGE.PT:
				text = pt_text
			Global.LANGUAGE.EN:
				text = en_text
