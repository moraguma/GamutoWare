extends RichTextLabel

func _ready() -> void:
	if Global.language == Global.LANGUAGE.PT:
		text = "Descubra a sequencia"
	elif Global.language == Global.LANGUAGE.EN:
		text = "Find the sequence"
