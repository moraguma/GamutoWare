extends Area2D

@onready var shader : ShaderMaterial = $Sprite2D.material

func _on_area_entered(area: Area2D) -> void:
	shader.set_shader_parameter("width", 1.0)

func _on_area_exited(area: Area2D) -> void:
	shader.set_shader_parameter("width", 0.0)
