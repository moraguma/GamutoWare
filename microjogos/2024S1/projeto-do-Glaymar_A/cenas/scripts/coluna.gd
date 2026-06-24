extends StaticBody2D

@onready var player : CharacterBody2D = get_parent().get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.global_position.y < global_position.y:
		z_index = 2
	else:
		z_index = 0
