extends PanelContainer

@export var main: Node2D
@export var price: int = 0
var enabled = preload("res://microjogos/2025S1/Cookies/recursos/shaders/enabled.tres")
var disabled = preload("res://microjogos/2025S1/Cookies/recursos/shaders/disabled.tres")

func _ready() -> void:
	add_theme_stylebox_override("normal", enabled)
	
func _process(delta: float) -> void:
	var stylebox: StyleBoxFlat = get_theme_stylebox("panel")
	stylebox = stylebox.duplicate()
	if main.cliques < price:
		stylebox.bg_color = Color(0, 1, 1, 0.1)
	else:
		stylebox.bg_color = Color(0, 1, 1, 0.8)
	add_theme_stylebox_override("panel", stylebox)
