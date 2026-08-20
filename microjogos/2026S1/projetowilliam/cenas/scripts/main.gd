extends Node2D
@export var rigid_body_2d_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Minigames.register_win(self)
	var screen_size = get_viewport_rect().size
	
	while true:
		var box = rigid_body_2d_scene.instantiate()
		box.position.x = randf_range(0, screen_size.x)
		var sprite_node : Sprite2D = box.get_node("Sprite2D")
		sprite_node.frame = randi_range(0, 9)
		box.position.y = screen_size.y + 100
		add_child(box)
		
		await get_tree().create_timer(0.2).timeout
