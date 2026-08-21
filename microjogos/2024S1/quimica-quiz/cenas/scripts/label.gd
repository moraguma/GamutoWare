extends Label

func _ready() -> void:
	match Global.language:
		Global.LANGUAGE.EN: text = "GET THE COFFEE"
		Global.LANGUAGE.PT: text = "PEGUE O CAFE"
