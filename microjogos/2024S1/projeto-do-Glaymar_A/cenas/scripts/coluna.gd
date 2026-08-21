extends StaticBody2D

@onready var player : CharacterBody2D = get_parent().get_parent().get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	z_index = 2 if player.global_position.y < global_position.y else 0
