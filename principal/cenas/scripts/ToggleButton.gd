extends Node2D


export (Array, String) var microgame_paths
export var toggled = false


const TOGGLED_FRAME = 1
const UNTOGGLED_FRAME = 0


onready var button = $Button
onready var sprite = $Toggle


func _ready():
	update_sprite()
	
	button.connect("pressed", self, "toggle")


func toggle():
	if toggled:
		toggled = false
		sprite.frame = UNTOGGLED_FRAME
	else:
		toggled = true
		sprite.frame = TOGGLED_FRAME


func update_sprite():
	if toggled:
		sprite.frame = TOGGLED_FRAME
	else:
		sprite.frame = UNTOGGLED_FRAME
