extends Node2D


const WIDTH = 480
const HEIGHT = 270


signal win
signal lose


func _ready():
	NotificationCenter.notify("DESENVOLVA!")


func _process(delta):
	if Input.is_action_just_pressed("acao"):
		emit_signal("win")
	elif Input.is_action_just_pressed("sair"):
		emit_signal("lose")
