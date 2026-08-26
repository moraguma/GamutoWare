extends CharacterBody2D

func _ready() -> void:
	velocity.x = 1200
	
func _physics_process(_delta):
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Minigames.register_lose(self)
	body.queue_free()
	queue_free()
