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
		button.focus_neighbour_top = top
	if right != null:
		button.focus_neighbour_right = right
	if bottom != null:
		button.focus_neighbour_bottom = bottom
	if left != null:
		button.focus_neighbour_left = left


func load_cover(cover):
	texture = cover


func load_button(active, path, to_call):
	load_button_ref()
	
	if active:
		button.connect("pressed", to_call, "detail", [path, button])
	else:
		button.connect("pressed", to_call, "fail_detail")
