extends Node2D

var presets = [[1,5,6],[0,4,8],[2,3,7]]

func _ready() -> void:
	presets.shuffle()
	var selected = presets[0]
	for i in selected:
		get_child(i).can_open = true
