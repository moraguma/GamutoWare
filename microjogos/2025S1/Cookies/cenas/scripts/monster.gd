extends CharacterBody2D

var health = 500

func _ready() -> void:
	velocity.y = -300

func _process(delta: float) -> void:
	if health > 0 and velocity.y > -300:
		velocity.y -= 20
		if velocity.y >= 300:
			velocity.y = 300
		
	if position.y <= 400.0:
		$AnimatedSprite2D.frame = 1
		velocity.y = 0
		health = 500
		get_parent().register_lose()
	move_and_slide()
func hit(damage: float):
	if health > 0:
		velocity.y = damage * 0.1
		health -= damage
		$HitFlash.play("hit_flash")
		$HealthBar.value = health
		if health <= 0:
			velocity.y = 300
			get_parent().register_win()
