extends Label

func _ready() -> void:
	match Global.language:
		Global.LANGUAGE.EN:
			text = "Punch!"
		Global.LANGUAGE.PT:
			text = "Soque!"
