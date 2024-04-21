extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	set_pressed_no_signal(!SoundController.is_muted())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("silenciar"):
		set_pressed_no_signal(!SoundController.is_muted())
	
func _toggled(toggled_on):
	if not toggled_on:
		SoundController.mute_all()
	else:
		SoundController.unmute_all()
