extends Area2D
@onready var anim: AnimatedSprite2D = $gam_triste


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize_position()
	anim.play("crying")
	
func tornar_feliz():
	anim.visible = false
	$gam_feliz.visible = true
func randomize_position():
	var min_x = 80
	var max_x = 1800
	var min_y = 80
	var max_y = 970
	
	var random_x = randf_range(min_x, max_x)
	var random_y = randf_range(min_y, max_y)
	
	position = Vector2(random_x, random_y)
