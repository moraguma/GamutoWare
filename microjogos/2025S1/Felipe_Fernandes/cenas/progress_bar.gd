extends TextureProgressBar

@onready var icon: Sprite2D = $icon
@onready var target: Sprite2D = $target

@export var target_value = 75

func _ready() -> void:
	target.position.y = size.y - (target_value * (size.y / 100))

func _process(delta: float) -> void:
	icon.position.y = size.y - (value * (size.y / 100))
	
