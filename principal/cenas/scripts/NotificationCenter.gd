extends Control


const TOTAL_NOTIFICATIONS = 3


@onready var notification = $NotificationContainer/Notification
@onready var animation_player = $AnimationPlayer
@onready var input_hint = $NotificationContainer/InputHint

func _ready() -> void:
	input_hint.visible = false

func notify(text):
	notification.text = "[center][shake rate=15 level=30]" + text
	var anim = "notify_" + str(randi() % TOTAL_NOTIFICATIONS + 1)
	animation_player.stop()
	animation_player.play(anim)

func notify_with_input_hint(text, microgame: MicrogameAsset):
	input_hint.visible = true
	input_hint.display_microgame_actions(microgame)
	notify(text)
	
