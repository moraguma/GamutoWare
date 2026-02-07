extends Label

func _ready() -> void:
	match Global.language:
		Global.LANGUAGE.PT:
			match text:
				"Cannon": text = "Canhão"
				"Turret": text = "Torreta"
				"Press [Space]": text = "Pressione [Espaço]"
