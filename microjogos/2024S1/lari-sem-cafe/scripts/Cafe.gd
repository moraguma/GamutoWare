extends Area2D

@onready var anim = $"AnimatedSprite2D" as AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	anim.play("gone")
	
func _on_animated_sprite_2d_animation_finished():
	queue_free()

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	queue_free()
	$"../".register_win()

func _on_area_entered(area):
	queue_free()
