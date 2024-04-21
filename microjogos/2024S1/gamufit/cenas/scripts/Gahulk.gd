extends Node2D

# Declare variáveis para os sprites
var suffering_sprite
var exercising_sprite

func _ready():
	# Carregue os sprites
	suffering_sprite = get_node("Sprite2D-suffering")
	exercising_sprite = get_node("Sprite2D-exercising")

func _on_gamuto_collided():
	change_sprite()

func _on_gamuto_not_collided():
	change_sprite()

func change_sprite():
	# Verifique qual sprite está visível atualmente e alterne
		suffering_sprite.visible = not suffering_sprite.visible
		exercising_sprite.visible = not exercising_sprite.visible
