extends CharacterBody2D

signal G1

func _ready():
	var rng = RandomNumberGenerator.new()
	position.x = rng.randf_range(-500, 1500)
	velocity.x = 200

func _physics_process(delta):
	if position.x >= 1600:
		position.x = -500
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if velocity.x != 0:
		$Gamuto0.visible = false
		get_node("../Yay").play()
		velocity.x = 0
		emit_signal("G1")
		
