extends CharacterBody2D

signal G2

func _ready():
	var rng = RandomNumberGenerator.new()
	position.x = rng.randf_range(100, 700.0)
	position.y = 100
	velocity.y = -200
	
func _physics_process(delta):
	if position.y <= -700:
		velocity.y = 200
	if position.y >= 90:
		velocity.y = -200

	move_and_slide()


func _on_area_2d_body_entered(body):
	if velocity.y !=0:
		$Gamuto0.visible = false
		get_node("../Yay").play()
		velocity.y = 0
		emit_signal("G2")
