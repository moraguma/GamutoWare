extends TextureRect


onready var progress_bar = $ProgressBar
onready var label = $Label


func _process(delta):
	var power = OS.get_power_percent_left()
	if power == -1:
		power = 100
	
	label.text = str(power) + "%"
	progress_bar.value = power
