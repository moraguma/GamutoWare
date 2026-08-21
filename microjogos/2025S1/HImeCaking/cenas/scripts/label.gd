extends RichTextLabel

func _ready() -> void:
	if Global.language == Global.LANGUAGE.PT:
		text = "[wave amp=30 freq=5]Eu amo bolo\n❤[/wave]"
	elif Global.language == Global.LANGUAGE.EN:
		text = "[wave amp=30 freq=5]I love cake\n❤[/wave]"

func got_it():
	if Global.language == Global.LANGUAGE.PT:
		text = "[wave amp=30 freq=5]Isso dai![/wave]"
	elif Global.language == Global.LANGUAGE.EN:
		text = "[wave amp=30 freq=5]Got it![/wave]"
		
func try_again():
	if Global.language == Global.LANGUAGE.PT:
		text = "[wave amp=30 freq=5]Tente denovo![/wave]"
	elif Global.language == Global.LANGUAGE.EN:
		text = "[wave amp=30 freq=5]Try again![/wave]"
		
