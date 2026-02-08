extends CharacterBody2D
@export var is_alive = true

func _ready() -> void:
	$PlayerAnimation.play("idle")
	

func kill() -> void:
	get_parent().register_lose()
	$PlayerAnimation.play("death")
	is_alive = false
	
func attack(direction) -> void:
	if $PlayerSprite.flip_h:
		$PlayerSprite.flip_h = false
		$SwordCollision.scale.x = 1
		
	if  direction == "Up":
		$PlayerAnimation.play("attack_up")
	elif direction == "Down":
		$PlayerAnimation.play("attack_down")
	else:
		if direction == "Left":
			$PlayerSprite.flip_h = true
			$SwordCollision.scale.x = -1
		$PlayerAnimation.play("attack_side")
	
	await $PlayerAnimation.animation_finished
	
	$PlayerAnimation.play("idle")
