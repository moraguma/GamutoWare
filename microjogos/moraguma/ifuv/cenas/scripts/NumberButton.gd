extends "res://microjogos/moraguma/ifuv/cenas/scripts/Button.gd"


@export var number : int


@onready var display = $Display


func _ready():
	display.text = "[center]" + str(number)
	super._ready()


func press():
	super.press()
	
	main.input_number(number)
