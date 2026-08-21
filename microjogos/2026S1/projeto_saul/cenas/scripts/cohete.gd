extends PathFollow2D
var voando = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.visible = false
	

func ignicion():
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play("ignicion")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if voando:
		progress += 400*delta
	if progress_ratio == 1:
		$AnimatedSprite2D.rotation_degrees = 270
		$AnimatedSprite2D.play("fueguito")
		$hit.play()
		



func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "ignicion":
		voando = true
		$AnimatedSprite2D.play("vuelo")


func _on_area_2d_body_entered(Body: CollisionObject2D) -> void:
	if Body.name == "Alien":
		Body.vivo = false
		$AnimatedSprite2D.visible = false
		Minigames.register_lose(self)
		queue_free()
		
	
