extends CharacterBody2D

func atirar():
	$Sprite.play("shot")
	$Gunshot.play()

func morrer():
	$AnimationPlayer.play("death")
	$Sprite.pause()

func _on_sprite_animation_finished() -> void:
	$Sprite.play("default")
	
