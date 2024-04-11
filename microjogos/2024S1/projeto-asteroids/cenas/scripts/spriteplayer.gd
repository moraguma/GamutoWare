extends Sprite2D

signal dead

var char_tex_player = preload("res://microjogos/2024S1/projeto-asteroids/recursos/sprites/player.png")
var char_tex_explosion = preload("res://microjogos/2024S1/projeto-asteroids/recursos/sprites/explosion.png")  

func _ready():
	
	texture = char_tex_player
	pass

func _on_player_body_entered(body):
	if body.is_in_group("asteroids"):
		emit_signal("dead")
		hide()
		var a = get_node("../AnimatedSprite2D")
		a.play("new_animation")
		
	pass # Replace with function body.
