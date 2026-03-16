extends Node

var last_was_gamepad: bool = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed():
			last_was_gamepad = false
	
	if event is InputEventJoypadButton:
		if event.is_pressed():
			last_was_gamepad = true
