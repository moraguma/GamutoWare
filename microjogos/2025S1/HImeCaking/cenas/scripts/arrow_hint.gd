extends Sprite2D
@export var ref_arrow:Sprite2D

func _process(_delta: float) -> void:
	if ref_arrow.visible:
		frame = ref_arrow.frame
		visible = true
