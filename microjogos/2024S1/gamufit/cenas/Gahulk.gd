extends Node2D

# Declare variáveis para os sprites
var suffering_sprite
var exercising_sprite

func _ready():
	# Carregue os sprites
	suffering_sprite = get_node("Sprite2D-suffering")
	exercising_sprite = get_node("Sprite2D-exercising")

	# Conecte o sinal 'gamuto_collided' emitido pelo Gamuto(icon)
	var gamuto = get_parent().get_node("SmallBar")
	gamuto.connect("gamuto_collided", _on_gamuto_collided)
	gamuto.connect("gamuto_not_collided", _on_gamuto_not_collided)
	

func _on_gamuto_collided():
	# Mude o sprite do Gahulk
	change_sprite()

func _on_gamuto_not_collided():
	# Volte ao sprite de suffering
	if exercising_sprite.visible:
		change_sprite2()

func change_sprite():
	# Verifique qual sprite está visível atualmente e alterne
		suffering_sprite.visible = false
		exercising_sprite.visible = true
		
func change_sprite2():
	# Verifique qual sprite está visível atualmente e alterne
		suffering_sprite.visible = true
		exercising_sprite.visible = false

