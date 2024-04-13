extends Node2D

var displaying: bool = false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var title_label: RichTextLabel = $Control/ScrollContainer/VBoxContainer/Header
@onready var body_label: RichTextLabel = $Control/ScrollContainer/VBoxContainer/Body


func display(title: String, body: String):
	if displaying:
		animation_player.play_backwards("appear")
		await animation_player.animation_finished
	else:
		displaying = true
	
	title_label.text = "[center][shake level=20]" + title
	body_label.text = body
	
	animation_player.play("appear")
