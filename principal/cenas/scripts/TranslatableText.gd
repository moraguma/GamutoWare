extends RichTextLabel


export (String) var pt_text
export (String) var en_text


func _ready():
	bbcode_enabled = true
	
	update_translation()
	
	add_to_group("translatable")


func update_translation():
	if pt_text != "" and en_text != "":
		match Global.language:
			Global.LANGUAGE.PT:
				bbcode_text = pt_text
			Global.LANGUAGE.EN:
				bbcode_text = en_text
