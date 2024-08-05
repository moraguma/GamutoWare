extends Area2D
@onready var anim = $"AnimatedSprite2D" as AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	queue_free() # Replace with function body.

var new_texture = preload("res://microjogos/2024S1/lari-sem-cafe/assets/stringstar fields/example.png")
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	anim.play("special") # Replace with function body.
	anim.scale.x = 1.2
	anim.scale.y = 1.2
	anim.position.y = -2
	$"AudioStreamPlayer".play()
	$"CollisionShape2D".queue_free()
	$"../BG/5/bg".play("disco")
	
