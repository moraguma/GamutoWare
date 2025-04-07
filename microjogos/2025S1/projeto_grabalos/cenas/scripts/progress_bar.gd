extends ProgressBar

signal half_threshold_reached(above: bool)

var velocity := 0.0
var speed := 1
var decrease_speed := 1.2
var previous_value := 0.0

func _process(delta: float) -> void:
	previous_value = value

	value -= decrease_speed
	value = max(18, value)
	
	var new_value = min(value + velocity, 100)
	value = new_value
	
	if Input.is_action_just_pressed("acao"):
		velocity += speed
		velocity = min(velocity, 4)
	
	velocity *= 0.9
	
	if value < 100 and value >= 99.9:
		value = 100
		velocity = 0
		speed = 0
		decrease_speed = 0
		$"../../..".register_win()
	
	# Check for 50% threshold crossing
	if previous_value < 50 and value >= 50:
		emit_signal("half_threshold_reached", true)
	elif previous_value >= 50 and value < 50:
		emit_signal("half_threshold_reached", false)
	
	previous_value = value
