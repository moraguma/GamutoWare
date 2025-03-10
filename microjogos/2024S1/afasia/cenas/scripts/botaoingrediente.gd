extends Button
@export var correto=true
@onready var gamuto = $"../Gamuto"

func _on_focus_entered():
	$Som.play()
	gamuto.position = position


func _on_pressed():
	if correto:
		get_parent().acertou()
