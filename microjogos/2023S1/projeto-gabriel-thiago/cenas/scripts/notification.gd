extends RichTextLabel
@onready var animation_player = $AnimationPlayer


func notify(text):
	text = "[center][shake rate=15 level=30]" + text
	animation_player.play("zoom")
