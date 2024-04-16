extends TouchScreenButton

signal touch_button_pressed(cell: Node)

func _ready():
	pressed.connect(get_parent()._on_touch_screen_button_0_pressed)
	pressed.connect(emit_touch_button_pressed_for_cursor)
	touch_button_pressed.connect($"../../../cursor_area"._on_some_cell_touched)
	pass

func _process(delta):
	pass

func emit_touch_button_pressed_for_cursor():
	touch_button_pressed.emit(get_parent())
