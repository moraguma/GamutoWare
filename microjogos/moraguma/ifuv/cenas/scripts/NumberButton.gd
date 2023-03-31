extends "res://microjogos/moraguma/ifuv/cenas/scripts/Button.gd"


@export (int) var number


@onready var display = $Display


func _ready():
	display.text = "[center]" + str(number)


func press():
	super.press()
	
	main.input_number(number)
