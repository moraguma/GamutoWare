extends Control


@onready var notification = $NotificationContainer/Notification
@onready var animation_player = $AnimationPlayer


func notify(text):
	notification.text = "[center][shake rate=15 level=30]" + text
	animation_player.play("notify")
