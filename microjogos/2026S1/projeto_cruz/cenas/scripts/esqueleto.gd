extends CharacterBody2D

const SPEED = 700.0

func _ready() -> void:
	velocity.x = -SPEED

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Minigames.register_lose(self)
		body.queue_free()
