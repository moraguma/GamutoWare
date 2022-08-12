extends Node2D

func _ready():
	$Musica.play()
	
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("CORTE!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("CUT!")

signal win
signal lose


const WIDTH = 1920
const HEIGHT = 1080
