extends "res://principal/cenas/scripts/ToTitle.gd"
func _ready() 
_process(delta)
if


@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("opening")
	
	GlobalCamera.enabled = true



