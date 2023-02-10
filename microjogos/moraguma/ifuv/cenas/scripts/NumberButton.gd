extends "res://microjogos/moraguma/ifuv/cenas/scripts/Button.gd"


export (int) var number


onready var display = $Display


func _ready():
	display.bbcode_text = "[center]" + str(number)


func press():
	.press()
	
	main.input_number(number)
