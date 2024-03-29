extends TextureRect


var to_call


var button


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
	load_button_ref()
	
	if active:
		button.connect("pressed",Callable(to_call,"detail").bind(path, button))
	else:
		button.connect("pressed",Callable(to_call,"fail_detail"))
