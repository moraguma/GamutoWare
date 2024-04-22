extends Control


const TOTAL_NOTIFICATIONS = 3


@onready var notification = $NotificationContainer/Notification
@onready var animation_player = $AnimationPlayer


func notify(text):
	notification.text = "[center][shake rate=15 level=30]" + text
	var anim = "notify_" + str(randi() % TOTAL_NOTIFICATIONS + 1)
	animation_player.stop()
	animation_player.play(anim)
