extends TextureRect


var to_call

var can_play
var button

@onready var cursor = $GMTCursor
@onready var play = $Play


func load_button_ref():
	if button == null:
		button = $Button


func _ready():
	load_button_ref()


func set_focuses(top, right, bottom, left):
	if top != null:
		button.focus_neighbor_top = top
	if right != null:
		button.focus_neighbor_right = right
	if bottom != null:
		button.focus_neighbor_bottom = bottom
	if left != null:
		button.focus_neighbor_left = left


func load_cover(cover):
	texture = cover


func load_button(active, path, to_call):
	can_play = path != "gamutoware"
	
	load_button_ref()
	
	if active:
		button.connect("pressed",Callable(to_call,"detail").bind(path, button))
	else:
		button.connect("pressed",Callable(to_call,"fail_detail"))


func show_play():
	if can_play:
		play.show()


func hide_play():
	if can_play:
		play.hide()


func _on_focus_entered() -> void:
	cursor.show()


func _on_focus_exited() -> void:
	cursor.hide()
