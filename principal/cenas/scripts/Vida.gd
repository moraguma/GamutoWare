extends "res://principal/cenas/scripts/Droppable.gd"


const AMOUNT_TO_FRAME = {1: 2, 2: 0, 3: 1}

onready var amount = get_parent().get_node("Amount")
onready var animation_player = $AnimationPlayer


func _ready():
	frame = AMOUNT_TO_FRAME[3]
	animation_player.play("idle")


func set_lives(n):
	if n <= 0:
		drop()
		animation_player.stop()
		amount.hide()
	else:
		amount.text = str(n)
		if AMOUNT_TO_FRAME.has(n):
			frame = AMOUNT_TO_FRAME[n]
