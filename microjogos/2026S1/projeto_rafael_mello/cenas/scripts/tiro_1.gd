extends Area2D

var speed = Vector2.ZERO;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	#$Sprite2D.material. = randf()*10
	$Sprite2D.material.set_shader_parameter("id", randf()*10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position += speed*delta;
