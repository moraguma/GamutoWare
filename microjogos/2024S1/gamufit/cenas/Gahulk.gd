extends Node2D

var gahulk_suffering_sprite
var gahulk_exercising_sprite

func _ready():
	# Obtém as referências aos sprites de sofrimento e exercício
	gahulk_suffering_sprite = $Sprite2D_Suffering
	gahulk_exercising_sprite = $Sprite2D_Exercising

	# Conecta o sinal emitido pelo SmallBar para detectar colisões com Gamuto(icon)
	$SmallBar.connect("gamuto_collided", self, "_on_small_bar_gamuto_collided")

# Método para lidar com o sinal emitido pelo SmallBar quando Gamuto(icon) colide
func _on_small_bar_gamuto_collided(body):
	# Mostra o sprite de exercício e oculta o sprite de sofrimento
	gahulk_exercising_sprite.visible = true
	gahulk_suffering_sprite.visible = false
