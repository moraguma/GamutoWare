extends CharacterBody2D

@export var vida := 10

@onready var player = get_parent().get_node("Player")
	
func hit(dano:int):
	vida -= dano
	if vida <= 0:
		queue_free()

func _physics_process(_delta):
	if player.vivo:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 250.0 
		move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hit(1)
