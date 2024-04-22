extends RichTextLabel


@export var translation_code: String
@export var center_text: bool


func _ready():
	bbcode_enabled = true
	
	update_translation()
	
	add_to_group("translatable")


func update_translation():
	text = ("[center]" if center_text else "") + TranslationManager.get_translation(translation_code)
