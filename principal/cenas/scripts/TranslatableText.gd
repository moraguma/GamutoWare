extends RichTextLabel


@export var pt_text: String
@export var en_text: String


func _ready():
	bbcode_enabled = true
	
	update_translation()
	
	add_to_group("translatable")


func update_translation():
	if pt_text != "" and en_text != "":
		match Global.language:
			Global.LANGUAGE.PT:
				text = pt_text
			Global.LANGUAGE.EN:
				text = en_text
