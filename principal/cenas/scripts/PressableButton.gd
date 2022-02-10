extends Button


func _ready():
	connect("pressed", SoundController, "play_sfx", ["click"])
